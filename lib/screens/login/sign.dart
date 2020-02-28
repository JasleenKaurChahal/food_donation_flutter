import 'package:flutter/material.dart';
import './sign_up_form.dart';
import '../../utils/constants/images.dart';

class Sign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignedUp();
  }
}

class SignedUp extends State<Sign>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Sign Up',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(1),
          image: DecorationImage(
            image:BACKGROUND,
            fit: BoxFit.cover,
          ),
        ),
          padding:EdgeInsets.all(30.0),
          child: TextEntriesForm()
        )
      ) 
    );
  }
}