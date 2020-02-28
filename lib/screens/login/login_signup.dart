import 'package:flutter/material.dart';
import './login_page_form.dart';
import './sign.dart';
import '../../utils/colors/colors.dart';

class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:Scaffold(
        backgroundColor: Color.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Container(
              // decoration:BoxDecoration(
              //   shape: BoxShape.rectangle,
              //   border: Border.all(
              //     color: Color.white,
              //     // width: 2.0,
              //     ),
              //   borderRadius: BorderRadius.circular(12),
              //   ),
              child:SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(child: new Container()),
                    TabBar(
                      tabs: [
                        Center(
                          child:Text("LogIn",style: TextStyle(color:Color.primaryColor),)),
                        Center(
                          child:Text("SignUp",style: TextStyle(color:Color.primaryColor),)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        body:TabBarView(
          children: <Widget>[
            LoginForm(),
            Sign(),
          ],
        )
      )
    );
  }
}