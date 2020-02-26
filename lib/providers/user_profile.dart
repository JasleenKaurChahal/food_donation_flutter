import 'package:flutter/material.dart';
import 'package:flutter_food_donation/models/user_profile.dart';

class UserProfileProvider with ChangeNotifier {
  UserProfileModel userProfileModel = UserProfileModel();
  void setNotificationCount() {
    // notificationCount =  api calls to get user name
    notifyListeners();
  }
}
