import 'package:Ayurveda/components/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../constants/apis.dart';
import '../common/horizontalposts.dart';
import '../common/bottombar.dart';


class Categories extends StatefulWidget {
  const Categories({super.key});
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<Map<String, List<dynamic>>> fetchPosts() async {
    final String postsapiurl = postsApi + '3,9,2,6,7' + '&per_page=50';
    final response = await http.get(Uri.parse(postsapiurl));
    if (response.statusCode == 200) {
      final List<dynamic> posts = json.decode(response.body);
      Map<String, List<Map<String, dynamic>>> categorizedPosts = {};
      for (var post in posts) {
        int categoryid = post['categories'][0];
        String categoryName = 'category_$categoryid';
        if (!categorizedPosts.containsKey(categoryName)) {
          categorizedPosts[categoryName] = [];
        }
        categorizedPosts[categoryName]!.add(post);
      }

      return categorizedPosts;
    } else {
      throw Exception(
          'Failed to fetch categories. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: Appbar(title: 'Categories'),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Container(
                  height: 80.0,
                  width: double.infinity,
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0, bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center, // Align items vertically in the center
                      children: [
                        Text(
                          'Ayushman',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ).copyWith(
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.account_circle, color: Colors.white),
                          iconSize: 35.0, // Adjust the size as needed
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Profile()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),


                const SizedBox(height: 10.0),
                FutureBuilder<Map<String, List<dynamic>>>(
                  future: fetchPosts(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(children: [
                        Container(
                          height: 400.0,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                              color: const Color.fromARGB(255, 222, 205, 252)),
                        )
                      ]);
                    } else if (snapshot.hasError) {
                      return Container(
                        height: 400.0,
                        alignment: Alignment.center,
                        child: Text("Error loading posts"),
                      );
                    } else {
                      Map<String, List>? categorizedPosts = snapshot.data;
                      if (categorizedPosts == null) {
                        return Text("No posts");
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                HorizontalPosts('Ayurvedic Medicines',
                                    categorizedPosts['category_3']),
                                HorizontalPosts('Beauty Tips',
                                    categorizedPosts['category_9']),
                                HorizontalPosts('Dry Fruits',
                                    categorizedPosts['category_2']),
                                HorizontalPosts('Fit Daily Routines',
                                    categorizedPosts['category_6']),
                                HorizontalPosts(
                                    'Fruits', categorizedPosts['category_7']),
                              ],
                            )),
                      );
                    }
                  },
                )
              ]))),
      bottomNavigationBar: Bottombar(currentIndex: 0),
    );
  }
}
