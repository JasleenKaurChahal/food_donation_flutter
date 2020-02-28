import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/app_bar.dart';
import 'package:flutter_food_donation/components/logout_modal.dart';
import 'package:flutter_food_donation/screens/dashboard/dashboard.dart';
import 'package:flutter_food_donation/screens/dashboard/timeline.dart';
import 'package:flutter_food_donation/screens/ngoList/ngo_list.dart';
import 'package:flutter_food_donation/screens/userProfile/user_profile.dart';
import 'package:flutter_food_donation/services/firebase_authentication.dart';
import 'package:flutter_food_donation/utils/constants/images.dart';
import '../utils/colors/colors.dart';

class BottomTabNavigator extends StatefulWidget {
  @override
  _BottomTabNavigatorState createState() => _BottomTabNavigatorState();
}

class _BottomTabNavigatorState extends State<BottomTabNavigator> {
  int _selectedIndex = 0;
  int _currentIndex = 0;
  var col = [
    Colors.green,
    Colors.red,
    Colors.black,
    Colors.pink,
    Colors.blueAccent,
    Colors.purple
  ];

  final List<Widget> _children = [
    Dashboard(),
    AllNgoList(),
    Timeline(),
    Center(child: Text('history')),
    UserProfile()
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
      appBar: ReusableWidgets.getAppBar(_currentIndex),

      body: _children[_currentIndex],
      //body:Timeline(),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.primaryColor,
        unselectedItemColor: Colors.red,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: Colors.grey),
            icon: new Icon(Icons.home, color: Color.primaryColor),
            title: new Text('Home',
                style: TextStyle(
                    color:
                        _currentIndex == 0 ? Colors.grey : Color.primaryColor)),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.mail, color: Colors.grey),
            icon: new Icon(Icons.place, color: Color.primaryColor),
            title: new Text('Ngo',
                style: TextStyle(
                    color:
                        _currentIndex == 1 ? Colors.grey : Color.primaryColor)),
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: Colors.grey),
              icon: Icon(Icons.add, color: Color.primaryColor),
              title: Text('Add',
                  style: TextStyle(
                      color: _currentIndex == 2
                          ? Colors.grey
                          : Color.primaryColor))),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: Colors.grey),
              icon: Icon(Icons.history, color: Color.primaryColor),
              title: Text('History',
                  style: TextStyle(
                      color: _currentIndex == 3
                          ? Colors.grey
                          : Color.primaryColor))),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: Colors.grey),
              icon: Icon(Icons.person, color: Color.primaryColor),
              title: Text('Profile',
                  style: TextStyle(
                      color: _currentIndex == 4
                          ? Colors.grey
                          : Color.primaryColor)))
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Color.primaryColor,
              ),
              child: Container(
                  child: Row(
                children: <Widget>[
                  Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill, image: USER_IMAGE))),
                  SizedBox(width: 15.0),
                  Text('Welcome User!\nPlan your vacation',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white
                          // width:200.0
                          )),
                ],
              ))),
          ListTile(
            leading: Icon(Icons.info_outline, color: Color.black),
            //subtitle: Text('Select to change color'),
            title: Text('About us', style: TextStyle(color: Color.black)),
            //trailing: Icon(Icons.add,color:Colors.green),
            onTap: () => _onSelectItem(0),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Color.black),
            title: Text('Contact Us', style: TextStyle(color: Color.black)),
            onTap: () => _onSelectItem(1),
          ),
          ListTile(
              leading: Icon(Icons.flip_to_back, color: Color.black),
              title: Text('Log out', style: TextStyle(color: Color.black)),
              onTap: () {
                showDialog(
                    useRootNavigator: true,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          height: 250,
                          width: 100,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Image(
                                  image: NEED_FOOD,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                              ),
                              Text(
                                'Are you sure you want to \nlogout?',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            padding: EdgeInsets.all(10),
                            color: Color.primaryColor,
                            child: Text('Yes',
                                style: (TextStyle(
                                    fontSize: 20, color: Color.white))),
                            onPressed: () {
                              FirebaseAuthentication
                                  .logOutUsingUserByEmailPassword();
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 60),
                          ),
                          FlatButton(
                            padding: EdgeInsets.all(10),
                            color: Color.primaryColor,
                            child: Text('No',
                                style: (TextStyle(
                                    fontSize: 20, color: Color.white))),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                          ),
                        ],
                      );
                    });
                // FirebaseAuthentication.logOutUsingUserByEmailPassword();
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => DonationForm()),
                // );
              }),
        ],
      )),
    );
  }
}
