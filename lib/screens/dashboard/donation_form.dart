import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/app_bar.dart';
import 'package:flutter_food_donation/components/drop_down_list.dart';
import 'package:flutter_food_donation/screens/dashboard/timeline.dart';
import 'package:flutter_food_donation/utils/constants/images.dart';
import '../../utils/colors/colors.dart';

class DonationForm extends StatefulWidget {
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (context) => Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Donate Food Details',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 22.0, color: Color.primaryColor),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    NgoList(),
                    Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Pickup Address',
                                fillColor: Color.primaryColor),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Pickup Address';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'To NG0',
                              //fillColor: Color.primaryColor
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'To NG0',
                              //fillColor: Color.primaryColor
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'To NG0',
                              //fillColor: Color.primaryColor
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          RaisedButton(
                            color: Color.primaryColor,
                            textColor: Color.white,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                            child: Text('Donate'),
                          )
                        ]))
                  ],
                ))));
  }
}
