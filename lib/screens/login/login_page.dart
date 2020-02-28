import 'package:flutter/material.dart';
import './sign_up_icons.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//   FirebaseAuth _auth=FirebaseAuth.instance;
//   bool isLogged=false;

//   FirebaseUser myUser;

//   Future<FirebaseUser> _loginWithfacebook() async {
//     final facebookLogin = new FacebookLogin();
//     facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
//     //var facebookLogin = new FacebookLogin();
//     var result = await facebookLogin.logInWithReadPermissions(['email']);
//     print(result.status.toString());
// FacebookAccessToken facebookAccessToken = result.accessToken;
// AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);


//     if(result.status == FacebookLoginStatus.loggedIn){
//       FirebaseUser user = (await _auth.signInWithCredential(authCredential)).user;
//         // await _auth.signInWithFacebook(accessToken : result.accessToken.token).then((onValue){
//         //   isLogged=true;
//         // });
//       return user;
//     }
//     return null;
//   }
  
//   void _login(){
//     _loginWithfacebook().then((response){
//       if(response!=null){
//         myUser=response;
//       }

//     });
//   }
  @override
  Widget build(BuildContext context) {
    return Center(
      child:SignUpIcons()
    );        
  }
}