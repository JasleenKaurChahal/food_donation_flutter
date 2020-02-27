import 'package:flutter/material.dart';
import 'package:flutter_food_donation/providers/agent_profile.dart';
import 'package:flutter_food_donation/providers/ngo_list.dart';
import 'package:flutter_food_donation/providers/post.dart';
import 'package:flutter_food_donation/providers/user_profile.dart';
import 'package:flutter_food_donation/routes/routes.dart';
import 'package:flutter_food_donation/screens/dashboard/donation_form.dart';
import 'package:flutter_food_donation/screens/dashboard/timeline.dart';
import 'components/bottom_tab_navigator.dart';
import './utils/colors/colors.dart';
import './screens/login/login_signup.dart';
import './routes/constants.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AgentProfileProvider>(
            create: (context) => AgentProfileProvider()),
        ChangeNotifierProvider<UserProfileProvider>(
            create: (context) => UserProfileProvider()),
        ChangeNotifierProvider<NgoListProvider>(
            create: (context) => NgoListProvider()),
        ChangeNotifierProvider<PostProvider>(
            create: (context) => PostProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Donation App',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Color.primaryColor,
          ),
          // onGenerateRoute: Router.generateRoute,
          //initialRoute: timelineRoute,
          home: BottomTabNavigator()
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
          ),
    );
  }
}
