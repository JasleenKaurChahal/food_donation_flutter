import 'package:flutter/material.dart';
import 'package:flutter_food_donation/providers/post.dart';
import 'package:provider/provider.dart';
import '../utils/constants/images.dart';
import '../utils/colors/colors.dart';

class Post extends StatelessWidget {
  final String type;
  Post(this.type);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: (MediaQuery.of(context).orientation == Orientation.portrait)
            ? EdgeInsets.all(10.0)
            : EdgeInsets.fromLTRB(100, 10, 100, 10),
        decoration: BoxDecoration(
          border: Border.all(color: Color.primaryColor, width: 2.0),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Consumer<PostProvider>(
                        builder: (context, postProvider, child) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.primaryColor, width: 2.0),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: postProvider.image, fit: BoxFit.fill)),
                      );
                    }),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 15),
                    // ),
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Consumer<PostProvider>(
                                builder: (context, postProvider, child) {
                              return Text(
                                postProvider.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              );
                            })),
                        Container(
                            child: Text('Banglore',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16))),
                      ],
                    ),
                  ],
                ),
                Consumer<PostProvider>(builder: (context, postProvider, child) {
                  return Positioned(
                    right: 10,
                    top: 20,
                    child: Icon(
                      Icons.people,
                      color: Color.primaryColor,
                    ),
                  );
                })
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Consumer<PostProvider>(builder: (context, postProvider, child) {
              return Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(1),
                  image: DecorationImage(
                    image: (type == 'ngo')
                        ? NGO_POST[postProvider.index]
                        : POST_IMAGES[postProvider.index],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
          ],
        ));
  }
}
