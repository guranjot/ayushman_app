import 'package:flutter/material.dart';
import '../common/appbar.dart';
import '../common/bottombar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: 'About Us'),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Ayushman App',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 15.0,),
                Text(
                  '''
In the Ayushman app you've been developing, you've integrated various features related to Ayurveda and wellness. Users can access information about different categories such as herbal remedies, yoga practices, meditation techniques, dietary recommendations, and lifestyle tips. The app offers a comprehensive platform for users to explore and learn about Ayurvedic principles and practices to improve their overall health and well-being.\n\nYou've implemented functionalities for users to browse through different categories, access detailed information about specific remedies or practices, and even follow guided tutorials for yoga or meditation sessions. Additionally, you've incorporated features like user profiles, favorites, and possibly a community aspect where users can share their experiences, ask questions, and interact with each other.\n\nOverall, the Ayushman app aims to provide a holistic approach to health and wellness based on Ayurvedic principles, offering users a convenient and informative resource to support their journey towards a healthier lifestyle.''',
                  style: TextStyle(
                    color: Colors.white,  
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 15.0),
                Text(
                  '''At Aayurveda, we are committed to providing you with a user-friendly and enriching experience. Our team of Ayurvedic practitioners, nutritionists, and wellness experts is dedicated to guiding you towards a state of equilibrium and vitality. Thank you for choosing [Your App Name] as your companion on the path to well-being. Embrace the wisdom of Ayurveda and embark on a holistic journey towards a healthier, happier, and more balanced life.''', 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ]
            ),
          )
        )
      ),
      bottomNavigationBar: Bottombar(currentIndex: 2),
    );
  }
}