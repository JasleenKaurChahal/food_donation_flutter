import 'package:flutter/material.dart';
import 'package:flutter_food_donation/routes/routes.dart';
import 'package:flutter_food_donation/screens/dashboard/donation_form.dart';
import 'package:flutter_food_donation/screens/dashboard/timeline.dart';
import 'components/bottom_tab_navigator.dart';
import './utils/colors/colors.dart';
import './screens/login/login_signup.dart';
import './routes/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Color.primaryColor,
      ),
      // onGenerateRoute: Router.generateRoute,
      //initialRoute: timelineRoute,
      home:BottomTabNavigator()
      //home:Timeline()
      //home:LoginSignUp()
      // home: Scaffold(
      //     body: Container(
      //       decoration: BoxDecoration(
      //       color: Colors.transparent.withOpacity(1),
      //       image: DecorationImage(
      //         image:NetworkImage('https://i.pinimg.com/474x/e8/56/87/e85687f71c27c584818f4210040f0f9c.jpg'),
      //         fit: BoxFit.fill,
      //         ),
      //       ),
      //       child: LoginSignUp()  
      //       )
      //     ),
    );
  }
}

