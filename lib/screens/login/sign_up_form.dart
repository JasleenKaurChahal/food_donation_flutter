import 'package:flutter/material.dart';
import './sign_up_icons.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class TextEntriesForm extends StatefulWidget {
  @override
  _TextEntriesFormState createState() => _TextEntriesFormState();
}

class _TextEntriesFormState extends State<TextEntriesForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    FocusNode nameNode,emailNode,phoneNode,passNode,confirmpassNode;
      bool _autoValidate = false;
      String _name;
      String _email;
      String _mobile;
      String _pass;
      String _confirmPass;
      bool loading=false;
  
      void _onLoading() {
        setState(() {
          loading = true;
          new Future.delayed(new Duration(seconds: 3), _login);
        });
      }

      Future _login() async{
        setState((){
          loading = false;
        });
        signInFunc();
      }

  @override
  // void initState() {
  //   super.initState();
  //   nameNode = FocusNode();
  //   emailNode = FocusNode();
  //   phoneNode = FocusNode();
  //   passNode = FocusNode();
  //   confirmpassNode = FocusNode();
  //   nameNode.addListener(() {
  //     if(nameNode.hasFocus){  
  //       }  
  //       else
  //         validate();
  //   });
  // } 

        // @override
        // void dispose() {
        //   // Clean up the focus node when the Form is disposed.
        // nameNode.dispose();
        // emailNode.dispose();
        // phoneNode.dispose();
        // passNode.dispose();
        // confirmpassNode.dispose();
        //   super.dispose();
        // }
      
        @override
        Widget build(BuildContext context) {
            double width = MediaQuery. of(context). size. width -80.0;
            double height = MediaQuery. of(context). size. height-200.0;

            TextStyle style = TextStyle(fontFamily: 'Roberto', fontSize: 20.0,color:Colors.black);
            TextEditingController name=TextEditingController();
            TextEditingController email=TextEditingController();
            TextEditingController phone=TextEditingController();
            TextEditingController pass=TextEditingController();
            TextEditingController confirmPass=TextEditingController();
          return ListView(
            children:<Widget>[Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child:Column(
              children: <Widget>[
              SizedBox(height:35.0),
              Center(child:Text('Sign Up',style:TextStyle(color:Colors.white,fontSize: 40.0))),
              SizedBox(height:40.0),
              TextFormField(
                    //focusNode: nameNode,
                    keyboardType: TextInputType.text,
                    controller: name,
                    cursorColor: Colors.black,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 12.0,color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Name",
                        prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black54,
                      ),
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                      border:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                      ),
                      validator: validateName,
                      onSaved: (String val) {
                        _name = val;
                      },  
                  ),
              SizedBox(height:10.0),
              TextFormField(
                    focusNode: emailNode,
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    cursorColor: Colors.black,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 12.0,color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Email",
                        prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.black54
                      ),
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        border:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                      ),
                      validator: validateEmail,
                      onSaved: (String val) {
                        _email = val;
                      },
                  ),
              SizedBox(height:10.0),
              TextFormField(
                    focusNode: phoneNode,
                    keyboardType: TextInputType.number,
                    controller: phone,
                    cursorColor: Colors.black,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 12.0,color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Phone Number",
                        prefixIcon: const Icon(
                        Icons.phone_in_talk,
                        color: Colors.black54
                      ),
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        border:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                      ),
                      validator: validateMobile,
                      onSaved: (String val) {
                        _mobile = val;
                      },
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    focusNode: passNode,
                    controller: pass,
                    cursorColor: Colors.black,
                    obscureText: true,
                    style: style,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 12.0,color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Password",
                        prefixIcon: const Icon(
                        Icons.lock_open,
                        color: Colors.black54
                      ),
                      suffixIcon:const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black54
                      ),
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        border:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                      ),
                      validator: validatePassword,
                      onSaved: (String val) {
                        _pass = val;
                      },
                  ),
                  SizedBox(height:10.0),
                  TextFormField(
                    focusNode: confirmpassNode,
                    controller: confirmPass,
                    cursorColor: Colors.black,
                    obscureText: true,
                    style: style,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 12.0,color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Confirm Password",
                        prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black54,
                      ),
                      suffixIcon:const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black54
                      ),
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        border:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                      ),
                      validator: validateConfirmPassword,
                      onSaved: (String val) {
                        _confirmPass = val;
                      },
                  ),
                  GestureDetector(
                    onTap:()=>forgetPass(context),
                    child:Container(
                    margin:EdgeInsets.only(left:180.0),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                    'Forget Password ?',textAlign:TextAlign.end,style:TextStyle(color:Colors.white,fontSize:16)
                  ))),
                  SizedBox(height:30.0),
                  SizedBox(
                    height: 40.0,
                    width: 300.0,
                    child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green)
                    ),
                    color:Colors.green.withOpacity(0.6),
                    child:loading?CircularProgressIndicator():Text('Sign Up',style:TextStyle(color:Colors.white,fontSize: 20)),
                    elevation:7.0,
                    onPressed:(){
                      _onLoading();
                      // signInFunc();
                    },
                    hoverElevation: 0.1,
                  )),
                  SizedBox(height: 30.0),
                  Divider(color: Colors.white),
                  Center(child:Text('OR',style:TextStyle(color:Colors.white))),
                  SizedBox(height:20.0),
                  SignUpIcons()
            ],     
          ))]);
        }
      
        String validateName(String value) {
          RegExp regex = RegExp(r'^[a-zA-Z]+$');
          if (!regex.hasMatch(value))
            return 'Enter Valid Name ';
          else if (value.length < 3)
            return 'Name must be more than 2 charaters';
          else
            return null;
        }
      
        String validateMobile(String value) {
      // Indian Mobile number are of 10 digit only
          if (value.length != 10)
            return 'Mobile Number must be of 10 digit';
          else
            return null;
        }
      
        String validateEmail(String value) {
          Pattern pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regex = new RegExp(pattern);
          if (!regex.hasMatch(value))
            return 'Enter Valid Email';
          else
            return null;
        }
      
        String validatePassword(String value) {
          RegExp regex = RegExp(r'^[A-Z]+$');
          if (value.length != 6)
          return 'Password must contain minimum 8 characters';
          else if(!regex.hasMatch(value))
          return 'Password must have one Capital Letter';
          else
            return null;
        }
      
        String validateConfirmPassword(String value) {
          RegExp regex = RegExp(r'^[A-Z]+$');
          if (value.length != 6)
            return 'Password must contain minimum 8 characters';
          else if(!regex.hasMatch(value))
            return 'Password must have one Capital Letter';
          else
            return null;
        }
        
        void signInFunc(){
          _formKey.currentState.save();
          print('here $loading');
            
      //       if (_formKey.currentState.validate()) {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => Login()));
      //   } else {
      // //    If all data are not valid then start auto validation.
      //     setState(() {
      //       _autoValidate = true;
      //     });
      //   }
          }
      
        void forgetPass(BuildContext context){
          var alert=AlertDialog(
              title:Text('Forget Password ?'),
              content:Text('Type \"123456abc\"')
          );
          showDialog(
            context: context,
            builder: (BuildContext context)=>alert
          );
        }
      
        void validate() {
          _formKey.currentState.validate();
        }
}