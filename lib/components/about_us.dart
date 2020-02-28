import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/app_bar.dart';
// import 'package:flutter_food_donation/screens/dashboard/carousal.dart';
import '../utils/colors/colors.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(0),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom:10.0),
        padding: EdgeInsets.all(15.0),
        child: ListView(children: <Widget>[
          Text('About Us',style: TextStyle(color: Color.primaryColor,fontSize: 25.0),textAlign: TextAlign.center,),
          SizedBox(height: 20.0,),
          // Carousal(),
          Text('We are helping the nnedy by providing them food without any middle men',style: TextStyle(color: Color.black,fontSize: 15.0),textAlign: TextAlign.center,)
        ],),     
      )
    );
  }
}