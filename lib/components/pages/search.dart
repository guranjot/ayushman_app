import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Ayurveda/components/pages/categories.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _textController = TextEditingController();
  List<String> _chatMessages = [];

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      String message = _textController.text;
      setState(() {
        _chatMessages.insert(0, message); // Insert user's message at the beginning of the list
      });
      _textController.clear();
      predictDrug(message); // Call predictDrug function with user's message text
    }
  }

  void predictDrug(String symptoms) {
    Map<String, dynamic> inputData = {"input_example": symptoms};

    String requestBody = json.encode(inputData);

    String url = 'https://ayurved-drug-prediction.onrender.com/predict';

    http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        String predictedDrug = data['predicted_drug'];
        setState(() {
          _chatMessages.insert(0, predictedDrug); // Insert model's reply at the beginning of the list
        });
        print('Predicted drug: $predictedDrug');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    }).catchError((error) {
      print('Error sending POST request: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 50, 182, 118),
      body: SafeArea(
        child: Column(
          children: [
            _topChat(),
            SizedBox(height: 8), // Keep some space below the app bar
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Set the background color to white
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _bodyChat(),
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        itemCount: _chatMessages.length,
                        itemBuilder: (context, index) {
                          return _buildMessageBubble(_chatMessages[index]);
                        },
                      ),
                    ),
                    _buildInputField(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _topChat() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Categories(),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              Text(
                'Ayushman Chat',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _bodyChat() {
    return Container(
      padding:
      EdgeInsets.only(left: 25, right: 25, top: 80), // Increase top padding
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
        color: Colors.white, // Set the background color to white
      ),
      child: Center(
        child: Text(
          "Are you feeling unwell? Please tell me what's the problem ?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String message) {
    final bool isUserMessage = _chatMessages.indexOf(message) % 2 == 0;

    return Align(
      alignment: isUserMessage ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.green : Color.fromARGB(255, 50, 182, 118), // Change colors as needed
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message,
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }



  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.grey[400]!, // Border color
                ),
                color: Colors.grey, // Gray-shaded background color
              ),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Type your message...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
              width: 8), // Add space between the input field and the button
          FloatingActionButton(
            onPressed: _sendMessage,
            child: Icon(Icons.send,color: Colors.white,),
            backgroundColor: const Color.fromARGB(255, 48, 152, 102),
          ),
        ],
      ),
    );
  }
}
