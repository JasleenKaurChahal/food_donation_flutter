import 'package:flutter/material.dart';
import 'package:flutter_food_donation/Helper/data.dart';
import 'package:flutter_food_donation/Helper/db_helper.dart';
import 'dart:async';
import 'package:flutter_food_donation/Helper/ngo_model.dart';
import 'package:flutter_food_donation/components/bottom_tab_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_food_donation/utils/constants/images.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCirc);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    Timer(Duration(seconds: 5), () {
      var dbHelper;
      dbHelper = DBHelper();
      print('Database and table created');
      Data.dataList.map((value) {
        NgoListModel e = NgoListModel(null, value['name'], value['address']);
        dbHelper.save(e);
      }).toList();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomTabNavigator()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 30.0),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: APP_LOGO,
                width: animation.value * 200,
                height: animation.value * 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
