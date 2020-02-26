import 'package:flutter/material.dart';
import 'package:flutter_food_donation/providers/dashboard.dart';
import 'package:flutter_food_donation/providers/user_profile.dart';
import 'package:provider/provider.dart';
import '../../utils/colors/colors.dart';
import '../../components/app_bar.dart';

class Dashboard extends StatelessWidget {
  final TextStyle _headingStyle = TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);
  final TextStyle _infoStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black);
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
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSteps(context, number, content) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        CircleAvatar(
          foregroundColor: Colors.black,
          radius: 20,
          backgroundColor: Colors.orange[300],
          child: Text(number.toString()),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
        ),
        Text(
          content,
          maxLines: 20,
          style: _infoStyle,
        )
      ],
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
                              image: AssetImage(
                                'assets/images/dashboard.jpg',
                              ),
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
                                      ? 100
                                      : 30),
                              Container(
                                height: 120,
                                width: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/logo.png'),
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
                      color: Color.primaryColor,
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
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Text('HOW IT WORKS — SIMPLE AS 1, 2, 3',
                        style: _headingStyle),
                    Padding(
                      padding: EdgeInsets.all(8),
                    ),
                    _buildSteps(context, 1, 'Donate using add Donate button'),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    _buildSteps(
                        context,
                        2,
                        (MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                            ? 'select donation by self or by agent \nthen complete process'
                            : 'select donation by self or by agent then complete process'),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    _buildSteps(
                        context,
                        3,
                        (MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                            ? 'you will get informed further information \naccording to your selected option'
                            : 'you will get informed further information according to your selected option'),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
