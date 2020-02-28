import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/history_container.dart';
import 'package:flutter_food_donation/components/history_container_type.dart';
import '../../utils/colors/colors.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(15.0),
      child: ListView(children: <Widget>[
        HistoryContainer(),
        HistoryContainerType(),
        HistoryContainer(),
        HistoryContainerType(),
        HistoryContainer(),
        HistoryContainerType(),
        HistoryContainer(),
      ],)      
    );
  }
}