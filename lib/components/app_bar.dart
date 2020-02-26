import 'package:flutter/material.dart';
import '../utils/colors/colors.dart';

class ReusableWidgets {
  static getAppBar(String title) {
    return  AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                    Color.primaryColor,
                    Colors.limeAccent,
                ])          
              ),        
            ),      
    );
  }
}
