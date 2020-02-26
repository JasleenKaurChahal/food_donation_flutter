import 'package:flutter/material.dart';
import 'package:flutter_food_donation/screens/dashboard/donation_form.dart';
import 'package:flutter_food_donation/screens/dashboard/timeline.dart';
import './constants.dart';

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case timelineRoute:
        return MaterialPageRoute(builder: (_) => Timeline());
      case donateFormRoute:
        return MaterialPageRoute(builder: (_) => DonationForm());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')
            ),
          )
        );
    }
  }
}