import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/bottom_tab_navigator.dart';
import './sign_up_icons.dart';
import 'package:flutter_food_donation/services/firebase_authentication.dart';
import '../../utils/colors/colors.dart';
import '../../utils/constants/images.dart';

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
      bool _obscure=true;
      bool _obscure1=true;

      void toggle(){
        setState(() {
          _obscure=!_obscure;
        });
      }
      
      void togglePass(){
        setState(() {
          _obscure1=!_obscure1;
        });
      }
  
      void _onLoading() {
        setState(() {
          loading = true;
          new Future.delayed(new Duration(seconds: 3), _signUp);
        });
      }

      Future _signUp() async{
        setState((){
          loading = false;
        });
        signInFunc();
      }

            TextStyle style = TextStyle(fontFamily: 'Roberto', fontSize: 20.0,color:Color.black);
            TextEditingController name=TextEditingController();
            TextEditingController email=TextEditingController();
            TextEditingController phone=TextEditingController();
            TextEditingController pass=TextEditingController();
            TextEditingController confirmPass=TextEditingController();

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            body:Container(
              decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(1),
              image: DecorationImage(
                image:BACKGROUND,
                fit: BoxFit.cover,
              ),
            ),
              padding:EdgeInsets.all(30.0),
              child: ListView(
            children:<Widget>[
            Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child:Column(
              children: <Widget>[
              SizedBox(height:35.0),
              Center(child:Text('Sign Up',style:TextStyle(color:Color.primaryColor,fontSize: 40.0))),
              SizedBox(height:40.0),
              TextFormField(
                    focusNode: nameNode,
                    keyboardType: TextInputType.text,
                    controller: name,
                    cursorColor: Color.primaryColor,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 12.0,color: Color.primaryColor),
                      filled: true,
                      fillColor: Color.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Name",
                        hintStyle:TextStyle(color:Color.primaryColor),
                        prefixIcon: const Icon(
                        Icons.person,
                        color: Color.primaryColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.primaryColor,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                      border:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Color.primaryColor,width: 2.0),
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
                    cursorColor: Color.primaryColor,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 12.0,color: Color.primaryColor),
                        filled: true,
                        fillColor: Color.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Email",
                        hintStyle:TextStyle(color:Color.primaryColor),
                        prefixIcon: const Icon(
                        Icons.email,
                        color: Color.primaryColor
                      ),
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.primaryColor,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        border:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Color.primaryColor,width: 2.0),
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
                    cursorColor: Color.primaryColor,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 12.0,color: Color.primaryColor),
                        filled: true,
                        fillColor: Color.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Phone Number",
                        hintStyle:TextStyle(color:Color.primaryColor),
                        prefixIcon: const Icon(
                        Icons.phone_in_talk,
                        color: Color.primaryColor
                      ),
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.primaryColor,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        border:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Color.primaryColor,width: 2.0),
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
                    cursorColor: Color.primaryColor,
                    obscureText: _obscure1,
                    style: style,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 12.0,color: Color.primaryColor),
                        filled: true,
                        fillColor: Color.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Password",
                        hintStyle:TextStyle(color:Color.primaryColor),
                        prefixIcon: const Icon(
                        Icons.lock_open,
                        color: Color.primaryColor
                      ),
                      suffixIcon:IconButton(icon:_obscure1?Icon(Icons.visibility_off,
                        color: Color.primaryColor
                      ):Icon(
                        Icons.visibility,
                        color: Color.primaryColor
                      ),
                      onPressed: (){
                        togglePass();
                      },
                      ),
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.primaryColor,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        border:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Color.primaryColor,width: 2.0),
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
                    cursorColor: Color.primaryColor,
                    obscureText: _obscure,
                    style: style,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 12.0,color: Color.primaryColor),
                        filled: true,
                        fillColor: Color.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Confirm Password",
                        hintStyle:TextStyle(color:Color.primaryColor),
                        prefixIcon: const Icon(
                        Icons.lock,
                        color: Color.primaryColor,
                      ),
                      suffixIcon:IconButton(
                        icon:_obscure?Icon(Icons.visibility_off,
                            color: Color.primaryColor
                          ):Icon(
                            Icons.visibility,
                            color: Color.primaryColor
                          ),
                        onPressed:(){
                          toggle();
                        }
                      ),
                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.primaryColor,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        border:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Color.primaryColor,width: 2.0),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                      ),
                      validator: validatePassword,
                      onSaved: (String val) {
                        _confirmPass = val;
                      },
                  ),
                  SizedBox(height:30.0),
                  SizedBox(
                    height: 40.0,
                    width: 300.0,
                    child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Color.primaryColor)
                    ),
                    color:Color.primaryColor.withOpacity(0.6),
                    child:loading?CircularProgressIndicator():Text('Sign Up',style:TextStyle(color:Colors.white,fontSize: 20)),
                    elevation:7.0,
                    onPressed:(){
                      _onLoading();
                    },
                    hoverElevation: 0.1,
                  )),
                  SizedBox(height: 30.0),
                  Divider(color: Color.primaryColor),
                  Center(child:Text('OR',style:TextStyle(color:Color.primaryColor))),
                  SizedBox(height:20.0),
                  SignUpIcons()
            ],     
          ))]) ),
          );
        }
      
        String validateName(String value) {
          if (value.length < 3)
            return 'Name must be more than 2 charaters';
          else
            return null;
        }
      
        String validateMobile(String value) {
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
          if (value.length < 6)
          return 'Password must contain minimum 6 characters';
          else
            return null;
        }
      
        void callback(){
          Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => BottomTabNavigator()),
                (_)=>false
                );
        }
        
        void signInFunc(){         
            if (_formKey.currentState.validate()) {
              if(_pass==_confirmPass){
              _formKey.currentState.save();  
              FirebaseAuthentication.createUserByEmailPassword(userName:_name,userEmail:_email,userPhone:_mobile,userPassword:_pass,callback:callback);
              } else {
                setState(() {
                  _autoValidate = true;
                });
              }}
              else{
                Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Passwords do not match!')));
              }
          }
      
        void validate() {
          _formKey.currentState.validate();
        }
}