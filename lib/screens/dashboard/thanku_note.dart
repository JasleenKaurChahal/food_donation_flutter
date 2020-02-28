import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/app_bar.dart';
import 'package:flutter_food_donation/components/bottom_tab_navigator.dart';
import 'package:flutter_food_donation/screens/dashboard/carousal.dart';
import 'package:flutter_food_donation/screens/dashboard/dashboard.dart';
import '../../utils/colors/colors.dart';

class ThankuNote extends StatelessWidget {
  Widget _buildDetailsItem(
      BuildContext context, IconData icon, String label, String info) {
    TextStyle _labelStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20.0,
    );
    TextStyle _infoStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    );
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        ),
        Text(
          label,
          style: _labelStyle,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 10, 20),
        ),
        Text(
          info,
          style: _infoStyle,
        )
      ],
    );
  }

  Widget _buildPersonalDetails(BuildContext context, String name,
      String address, String phoneNumber, String time) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildDetailsItem(context, Icons.person, 'NGO name: ', name),
          _buildDetailsItem(context, Icons.home, 'NGO Address: ', address),
          _buildDetailsItem(
              context, Icons.phone, 'Contact Number: ', phoneNumber),
          _buildDetailsItem(context, Icons.timer, 'Day and Time: ', time),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(2),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Carousal(),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text('Your PickUp location',
                    style: TextStyle(color: Color.primaryColor, fontSize: 20)),
              ),
              _buildPersonalDetails(
                  context,
                  "Smile Foundation",
                  "Btm Layout,Bangalore",
                  "+91-845637820",
                  'Thrusday,26 Feb \n1:00PM'),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTGswb0jhd5R1ybnoRfboP67hWKLpqDl3Z-hiaWjxIq8T4KPAaG'),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Color.primaryColor,
                child: Text('Go To Home Screen',
                    style: (TextStyle(fontSize: 18, color: Color.white))),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomTabNavigator()),
                  );
                },
              )
            ],
          ),
        ));
  }
}
