import 'package:flutter/material.dart';
import './sign_up_form.dart';

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
            image: NetworkImage('https://i.pinimg.com/474x/e8/56/87/e85687f71c27c584818f4210040f0f9c.jpg'),
            fit: BoxFit.fill,
          ),
        ),
          padding:EdgeInsets.all(30.0),
          child: TextEntriesForm()
        )
      ) 
    );
  }
}