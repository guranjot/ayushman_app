import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../pages/post.dart';

class HorizontalPosts extends StatelessWidget {
  final String categoryName;
  final List<dynamic>? posts;

  HorizontalPosts(this.categoryName, this.posts);

  @override
  Widget build(BuildContext context) {
    if (posts == null || posts!.isEmpty) {
      return Text("No posts available for $categoryName");
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,      
      children: [
        Text(
          categoryName,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600, 
            color: Colors.white                      
          )
        ),
        SizedBox(height: 10.0,),
        Container(
          height: 190,
          child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: posts!.length,
            itemBuilder: (BuildContext context, int index) {
              final postid = posts![index]['id'];
              final postThumbnail = posts![index]['featured_image_url'];
              final posttitle = posts![index]['title']['rendered'];
              return InkWell(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Post(postid: postid, posttitle:posttitle),
                    ),
                  )
                },
                child: Container(
                  height: 190.0,
                  width: 150.0,
                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: CachedNetworkImage(
                          imageUrl: postThumbnail,
                          fit: BoxFit.cover,
                          width: 150.0,
                          height: 190.0,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(color: const Color.fromARGB(255, 222, 205, 252)),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 150.0,
                          height: 190.0,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              posttitle,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 14.0,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              );
            },
          )
        ),
        SizedBox(height: 30.0,), 
      ]
    );
  }
}
