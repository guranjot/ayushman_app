import 'package:flutter/material.dart';
import '../../constants/texts.dart';
import 'package:Ayurveda/components/pages/categories.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00b09b),
              Color(0xFF96c93d),
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/ayushman-high-resolution-logo-transparent.png",
                  width: 300.0, // Increased width
                  height: 300.0, // Increased height
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 250.0), // Increased space between image and button
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Categories(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.green, // Foreground color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Border radius
                      side: BorderSide(color: Colors.deepPurple), // Border color
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Button padding
                  ),
                  child: Text(
                    AppStrings.btngetStarted,
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
