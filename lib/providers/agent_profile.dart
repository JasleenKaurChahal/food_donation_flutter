import 'package:flutter/material.dart';
import 'package:flutter_food_donation/models/agent_profile.dart';

class AgentProfileProvider with ChangeNotifier {
  AgentProfileModel agentProfileModel = AgentProfileModel();
  setname() {
    // agentProfileModel.userName='';
    notifyListeners();
  }
}
