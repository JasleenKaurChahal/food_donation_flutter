import 'package:flutter/material.dart';
import '../utils/colors/colors.dart';

class ReusableWidgets {
  static getAppBar(int index) {
    List title = ['Home', 'NGO List', 'Add Donations', 'History', 'Profile'];
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: true,
      title: Text(
        title[index],
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.primaryColor,
              Colors.limeAccent,
            ])),
      ),
    );
  }
}

// actions: <Widget>[
//             Consumer<DashboardProvider>(
//                 builder: (context, dashboardProvider, child) {
//               return Stack(
//                 children: <Widget>[
//                   Container(
//                       margin: EdgeInsets.all(10),
//                       child: Icon(
//                         Icons.notifications,
//                         size: 30,
//                       )),
//                   dashboardProvider.dashboardModel.notificationCount != 0
//                       ? Positioned(
//                           right: 11,
//                           top: 11,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             constraints: BoxConstraints(
//                               minWidth: 15,
//                               minHeight: 15,
//                             ),
//                             child: Text(
//                               '${dashboardProvider.dashboardModel.notificationCount}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         )
//                       : Container()
//                 ],
//               );
//             })
//           ]
