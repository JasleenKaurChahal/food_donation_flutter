import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthentication{
  static createUserByEmailPassword(
      {String userName,
      String userEmail,
      String userPassword,
      Function callback,
      String userPhone,
      Function showSnackBar}) {
        try{FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: userEmail.trim(), password: userPassword.trim())
                .then((currentUser)=> {
                  Firestore.instance
                  .collection("users")
                  .document(currentUser.user.uid)
                  .setData({
                    "uid":currentUser.user.uid,
                    "userName":userName,
                    "userEmail":userEmail,
                    "userPhone":userPhone
                  })
                  .then((result)=>{
                    callback()
                  })      
      }).catchError((err) {
        showSnackBar('User could not be created due to some error.');
        print('AN ERROR OCCURED WHILE CREATING USER $err');
      });}catch(err){
        print(err);
      }
  }


  static logInUserByEmailPassword(
      {String userEmail,
      String userPassword,
      Function callback,
      Function showSnackBar}) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userEmail.trim(), 
              password: userPassword.trim())
              .then((currentUser)=>{
                Firestore.instance
                .collection("users")
                .document(currentUser.user.uid)
                .get()
                .then((DocumentSnapshot result)=>{
                  callback()
                })          
              }).catchError((err){
                showSnackBar('User could not be created due to some error.');
                print('AN ERROR OCCURED WHILE CREATING USER $err');
              });
  }

  static addDonations({String ngoName,String address,String date,String time,String foodItem,String quantity,Function callback}){
    try{
      var id;
      var a=Firestore.instance.collection('users').snapshots();
      // print('a is ${a.uid}');
      FirebaseAuth.instance
      .currentUser()
      .then((currentUser)=>{
        id=currentUser.uid
      });
      
      FirebaseAuth.instance
      .currentUser()
      .then((result)=> {
      Firestore.instance
      .collection("donations")
      .document(result.uid)
      .setData({
        "donationId":result.uid,
        "userId":id,
        "ngoName":ngoName,
        "address":address,
        "date":date,
        "time":time,
        "foodItem":foodItem,
        "quantity":quantity
      })
      .then((result)=>{
        //callback()
      })});

    }catch(err){
      print(err);
    }

  }

  static logOutUsingUserByEmailPassword({Function callback}) async{
    try{
      await FirebaseAuth.instance.signOut().then((result)=>{
        callback()
      });  
    }catch(err){
      print(err);
    }
  }
}