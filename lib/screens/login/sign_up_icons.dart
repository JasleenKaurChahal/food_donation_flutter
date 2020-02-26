import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpIcons extends StatefulWidget {
  @override
  _SignUpIconsState createState() => _SignUpIconsState();
}

class _SignUpIconsState extends State<SignUpIcons> {
  @override
  Widget build(BuildContext context) {
    return  Row(children: <Widget>[
              SizedBox(width: 25.0,),
              GestureDetector(
              onTap:()=>socialLogIn(context),
              child :Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('https://icons.iconarchive.com/icons/danleech/simple/256/facebook-icon.png'))
                  ),
                  height: 70,
                  width: 70,
            )),
            SizedBox(width: 25.0,),
            GestureDetector(
            onTap:()=>socialLogIn(context),
            child:Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://pluspng.com/img-png/twitter-png-file-twitter-icon-png-256.png'))
                  ),
                  height: 100,
                  width: 100,
            )),
            SizedBox(width: 25.0,),
            GestureDetector(
              onTap:()=>socialLogIn(context),
              child:Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('https://i2.wp.com/vioside.com/blog/wp-content/uploads/2015/09/Google-Icon.jpeg?fit=259%2C194&ssl=1'))
                  ),
                  height: 70,
                  width: 70,
            ))
      ],
    );
  }
  
  void socialLogIn(BuildContext context){
    var alert=AlertDialog(
        title:Text('Social Sign Up :'),
        content:Text('Try again later! 😝😿🙉🤩')
    );
    showDialog(
      context: context,
      builder: (BuildContext context)=>alert
    );
  }
}