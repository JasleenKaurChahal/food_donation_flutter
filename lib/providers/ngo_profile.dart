import 'package:flutter/material.dart';
import 'package:flutter_food_donation/models/ngo_profile.dart';

class NgoProfileProvider with ChangeNotifier {
  NgoProfileModel ngoProfileModel = NgoProfileModel();
  void setNotificationCount() {
    // notificationCount =  api calls to get user name
    notifyListeners();
  }
}
