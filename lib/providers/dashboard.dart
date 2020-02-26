import 'package:flutter/material.dart';
import 'package:flutter_food_donation/models/dashboard.dart';

class DashboardProvider with ChangeNotifier {
  DashboardModel dashboardModel = DashboardModel();
  void setNotificationCount() {
    dashboardModel.notificationCount = 2;
    notifyListeners();
  }
}
