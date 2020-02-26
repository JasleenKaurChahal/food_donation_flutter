import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/app_bar.dart';
import 'package:flutter_food_donation/screens/dashboard/donation_form.dart';
import 'package:flutter_food_donation/screens/dashboard/timeline.dart';
import 'package:flutter_food_donation/services/firebase_authentication.dart';
import '../utils/colors/colors.dart';

class BottomTabNavigator extends StatefulWidget {
  @override
  _BottomTabNavigatorState createState() => _BottomTabNavigatorState();
}

class _BottomTabNavigatorState extends State<BottomTabNavigator> {
  int _selectedIndex = 0;
  int _currentIndex=0;
  var col=[Colors.green,Colors.red,Colors.black,Colors.pink,Colors.blueAccent,Colors.purple];

  final List<Widget> _children = [
  Timeline(),
  Center(child:Text('ngo')),
  Center(child:Text('add')),
  Center(child:Text('history')),
  Center(child:Text('profile')),
  DonationForm()

  // Assignment()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _onSelectItem(int index) {
  setState(() {
    _selectedIndex = index;
    });
  Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar('Donate Food'),

        body:_children[_currentIndex],
        //body:Timeline(),

        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.primaryColor,
        unselectedItemColor: Colors.red,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
          onTap: onTabTapped,
          currentIndex: _currentIndex, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                activeIcon:Icon(Icons.home,color:Colors.grey), 
                icon: new Icon(Icons.home,color:Color.primaryColor),
                title: new Text('Home',style:TextStyle(color:_currentIndex==0?Colors.grey:Color.primaryColor)),
              ),
              BottomNavigationBarItem(
                activeIcon:Icon(Icons.mail,color:Colors.grey), 
                icon: new Icon(Icons.place,color:Color.primaryColor),
                title: new Text('Ngo',style:TextStyle(color:_currentIndex==1?Colors.grey:Color.primaryColor)),
              ),
              BottomNavigationBarItem(
                activeIcon:Icon(Icons.person,color:Colors.grey), 
                icon: Icon(Icons.add,color:Color.primaryColor),
                title: Text('Add',style:TextStyle(color:_currentIndex==2?Colors.grey:Color.primaryColor))
              ),
              BottomNavigationBarItem(
                activeIcon:Icon(Icons.person,color:Colors.grey), 
                icon: Icon(Icons.history,color:Color.primaryColor),
                title: Text('History',style:TextStyle(color:_currentIndex==3?Colors.grey:Color.primaryColor))
              ),
              BottomNavigationBarItem(
                activeIcon:Icon(Icons.person,color:Colors.grey), 
                icon: Icon(Icons.person,color:Color.primaryColor),
                title: Text('Profile',style:TextStyle(color:_currentIndex==4?Colors.grey:Color.primaryColor))
              )
            ], 
          ),
        drawer:Drawer
        (
          child:ListView(children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(color: Color.primaryColor,),
              child:Container(
              child:Row(children: <Widget>[
              Container(
                  height:100.0,
                  width:100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                        "https://png.pngtree.com/png-clipart/20190629/original/pngtree-vector-add-user-icon-png-image_4101420.jpg"
                        )
                    )
                  )),
                  SizedBox(width:15.0),
                  Text('Welcome User!\nPlan your vacation',
                textAlign: TextAlign.center,
                style:TextStyle(
                  color:Colors.white
                  // width:200.0
                )
              ),
              ],)
            )
          ),
      ListTile(
        leading:Icon(Icons.info_outline,color:Color.black),
        //subtitle: Text('Select to change color'),
        title:Text('About us',style:TextStyle(color:Color.black)),
        //trailing: Icon(Icons.add,color:Colors.green),
        onTap: ()=>_onSelectItem(0),
      ),
      ListTile(
        leading:Icon(Icons.phone,color:Color.black),
        title:Text('Contact Us',style:TextStyle(color:Color.black)),
        onTap: ()=>_onSelectItem(1),
      ),
      ListTile(
        leading:Icon(Icons.flip_to_back,color:Color.black),
        title:Text('Log out',style:TextStyle(color:Color.black)),
        onTap: (){
          FirebaseAuthentication.logOutUsingUserByEmailPassword();
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => DonationForm()),
          // );
        }
      ),
    ],
  )
    ),
    );
  }
}