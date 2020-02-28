import 'package:flutter/material.dart';

class LogoutModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text('Are you sure you want to logout?'),
                      ),
                    );
                  });
            },
            child: Container());
      },
    );
  }
}
