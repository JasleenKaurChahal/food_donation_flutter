import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/post.dart';
import 'package:flutter_food_donation/providers/post.dart';
import 'package:flutter_food_donation/utils/constants/images.dart';
import 'package:provider/provider.dart';
import '../../utils/colors/colors.dart';

class Dashboard extends StatelessWidget {
  final TextStyle _headingStyle = TextStyle(
      fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black);
  Widget _buildQuotes(context, width, title, qoutes) {
    return Container(
      width: width,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              title,
              style: _headingStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text(
              '"' + qoutes + '"',
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Color.primaryColor),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 50;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.darken),
                              fit: BoxFit.fill,
                              image: DASHBOARD_COVER,
                            ),
                          ),
                          height: (MediaQuery.of(context).orientation ==
                                  Orientation.portrait)
                              ? (height / 3)
                              : (height / 2),
                        ),
                        Center(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                  height: (MediaQuery.of(context).orientation ==
                                          Orientation.portrait)
                                      ? 90
                                      : 30),
                              Container(
                                height: 120,
                                width: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: APP_LOGO,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(80.0),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Food Donation App',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildQuotes(context, width, 'Donate Food',
                              'Donate food whatever you want and we will take responsibility to let needy one use it')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var postProvider = Provider.of<PostProvider>(context);
                postProvider.setPostImage(NGO_PROFILE);
                postProvider.setPostName('Our Camp');
                postProvider.setPostIndex(index);
                return Post('ngo');
              },
              childCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
