import 'package:flutter/material.dart';
import '../utils/colors/colors.dart';

class NgoList extends StatefulWidget {
  @override
  _NgoListState createState() => _NgoListState();
}

class _NgoListState extends State<NgoList> {
String _dropDownValue;

@override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: _dropDownValue == null
          ? Text('Select the name of NGO')
          : Text(
              _dropDownValue,
              style: TextStyle(color: Color.primaryColor),
            ),
      isExpanded: true,
      iconSize: 30.0,
      style: TextStyle(color: Colors.blue),
      items: ['Goonj', 'Help Age of India', 'Smile Society'].map(
        (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
          () {
            _dropDownValue = val;
          },
        );
      },
    );
  }
}