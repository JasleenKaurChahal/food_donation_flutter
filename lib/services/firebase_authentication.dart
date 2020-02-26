import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthentication{
  static createUserByEmailPassword(
      {String userEmail,
      String userPassword,
      Function callback,
      Function showSnackBar}) {
        print(callback);
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEmail.trim(), password: userPassword.trim())
          .whenComplete(() {
        print('New User has been created.');
        callback();
      }).catchError((err) {
        showSnackBar('User could not be created due to some error.');
        print('AN ERROR OCCURED WHILE CREATING USER $err');
      });
  }

  static logOutUsingUserByEmailPassword() async{
    await FirebaseAuth.instance.signOut();
  }

}