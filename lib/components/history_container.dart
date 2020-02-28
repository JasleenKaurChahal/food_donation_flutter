import 'package:flutter/material.dart';
import '../utils/colors/colors.dart';

class HistoryContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Color.primaryColor,
          padding:EdgeInsets.all(10.0),
          margin: EdgeInsets.only(bottom:15.0),
          height:100,
          child: Column(children:<Widget>[
            Center(child:Text('Donation on 11 Feb,2020 with Ngo Goonj\n',style:TextStyle(color: Color.black))),
            Center(child:Text('Donation Items : Meal for 20 people',style:TextStyle(color: Color.black))),
            Center(child:Text('Delivery Type: By Agent Manish(8798098912)',style:TextStyle(color: Color.black))),
            ]
      ),
    );
  }
}