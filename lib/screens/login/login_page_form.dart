import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/bottom_tab_navigator.dart';
import 'package:flutter_food_donation/screens/login/sign_up_icons.dart';
import 'package:flutter_food_donation/services/firebase_authentication.dart';
import '../../utils/constants/images.dart';
import '../../utils/colors/colors.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    FocusNode nameNode,emailNode,phoneNode,passNode,confirmpassNode;
      bool _autoValidate = false;
      String _email;
      String _pass;
      bool loading=false;
      bool _obscure=true;
  
      void _onLoading() {
        setState(() {
          loading = true;
          new Future.delayed(new Duration(seconds: 3), _login);
        });
      }

      void toggele(){
        setState(() {
          _obscure=!_obscure;
        });
      }

      Future _login() async{
        setState((){
          loading = false;
        });
        signInFunc();
      }
        TextStyle style = TextStyle(fontFamily: 'Roberto', fontSize: 20.0,color:Color.black);
        TextEditingController email=TextEditingController();
        TextEditingController pass=TextEditingController();
      
        @override
        Widget build(BuildContext context) {
            
          return Container(
            decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(1),
            image: DecorationImage(
              image:BACKGROUND,
              fit: BoxFit.cover,
              ),
            ),
            child:Container(
              padding:EdgeInsets.all(10.0),
              child:Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child:Column(
              children: <Widget>[
              SizedBox(height:35.0),
              Center(child:Text('Log In',style:TextStyle(color:Color.primaryColor,fontSize: 40.0))),
              SizedBox(height:40.0),
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
                        fillColor: Colors.white.withOpacity(0.8),
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
                  SizedBox(height: 10.0,),
                  TextFormField(
                    focusNode: passNode,
                    controller: pass,
                    cursorColor: Color.primaryColor,
                    obscureText: _obscure,
                    style: style,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 12.0,color: Color.primaryColor),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Password",
                        hintStyle:TextStyle(color:Color.primaryColor),
                        prefixIcon: const Icon(
                        Icons.lock_open,
                        color: Color.primaryColor
                      ),
                      suffixIcon:IconButton(icon:_obscure?Icon(Icons.visibility_off,
                        color: Color.primaryColor
                      ):Icon(
                        Icons.visibility,
                        color: Color.primaryColor
                      ),
                      onPressed: (){
                        toggele();
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
                  GestureDetector(
                    onTap:()=>forgetPass(context),
                    child:Container(
                    margin:EdgeInsets.only(left:180.0),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                    'Forget Password ?',textAlign:TextAlign.end,style:TextStyle(color:Color.black,fontSize:16)
                  ))),
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
                    child:loading?CircularProgressIndicator():Text('Sign In',style:TextStyle(color:Colors.white,fontSize: 20)),
                    elevation:7.0,
                    onPressed:(){
                      _onLoading();
                      // signInFunc();
                    },
                    hoverElevation: 0.1,
                  )),
                  SizedBox(height: 30.0),
                  Divider(color: Color.primaryColor),
                  Center(child:Text('OR',style:TextStyle(color:Color.primaryColor))),
                  SizedBox(height:20.0),
                  // LoginPage()
                  SignUpIcons()
            ],     
          ))));
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
          // RegExp regex = RegExp(r'^[A-Z]+$');
          if (value.length < 6)
          return 'Password must contain minimum 6 characters';
          // else if(!regex.hasMatch(value))
          // return 'Password must have one Capital Letter';
          else
            return null;
        }

        void callBack(){
          Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BottomTabNavigator()));
        }
        
        void signInFunc(){
            if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
          FirebaseAuthentication.logInUserByEmailPassword(userEmail:_email,userPassword:_pass,callback:callBack);
          } else {
            setState(() {
              _autoValidate = true;
            });
          }
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