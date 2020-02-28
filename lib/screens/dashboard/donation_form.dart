import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/app_bar.dart';
import 'package:flutter_food_donation/components/drop_down_list.dart';
import 'package:flutter_food_donation/screens/dashboard/thanku_note.dart';
import 'package:flutter_food_donation/screens/dashboard/timeline.dart';
import 'package:flutter_food_donation/utils/constants/images.dart';
import 'package:flutter_food_donation/components/bottom_tab_navigator.dart';
// import 'package:flutter_food_donation/components/drop_down_list.dart';
// import 'package:flutter_food_donation/screens/dashboard/timeline.dart';
// import 'package:flutter_food_donation/utils/constants/images.dart';
import '../../utils/colors/colors.dart';
import 'package:flutter_food_donation/services/firebase_authentication.dart';

class DonationForm extends StatefulWidget {
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();
  String _dropDownValue;

  void callBack() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ThankuNote()));
  }

  String _address;
  String _time;
  String _date;
  String _foodItem;
  String _quantity;

  TextEditingController address = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController foodItem = TextEditingController();
  TextEditingController quantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(2),
        body: Builder(
            builder: (context) => ListView(children: <Widget>[
                  Container(
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
                            style: TextStyle(
                                fontSize: 22.0, color: Color.primaryColor),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          DropdownButton(
                            hint: _dropDownValue == null
                                ? Text('Select the name of NGO')
                                : Text(
                                    _dropDownValue,
                                    style: TextStyle(color: Color.primaryColor),
                                  ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Color.primaryColor),
                            items: [
                              'Goonj',
                              'Help Age of India',
                              'Smile Society'
                            ].map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                () {
                                  _dropDownValue = val;
                                },
                              );
                            },
                          ),
                          Form(
                              key: _formKey,
                              child: Column(children: <Widget>[
                                TextFormField(
                                    controller: address,
                                    decoration: const InputDecoration(
                                        hintText: 'Your Adress',
                                        hintStyle: TextStyle(
                                            color: Color.primaryColor)),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter valid Address';
                                      }
                                      return null;
                                    },
                                    onSaved: (String val) {
                                      _address = val;
                                    }),
                                TextFormField(
                                    controller: date,
                                    decoration: const InputDecoration(
                                        hintText: 'Date of Donation',
                                        hintStyle: TextStyle(
                                            color: Color.primaryColor)),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter date';
                                      }
                                      return null;
                                    },
                                    onSaved: (String val) {
                                      _date = val;
                                    }),
                                TextFormField(
                                    controller: time,
                                    decoration: const InputDecoration(
                                        hintText: 'Time of Donation',
                                        hintStyle: TextStyle(
                                            color: Color.primaryColor)),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter time';
                                      }
                                      return null;
                                    },
                                    onSaved: (String val) {
                                      _time = val;
                                    }),
                                TextFormField(
                                    controller: foodItem,
                                    decoration: const InputDecoration(
                                        hintText: 'Specify Food Items',
                                        hintStyle: TextStyle(
                                            color: Color.primaryColor)),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter food Items';
                                      }
                                      return null;
                                    },
                                    onSaved: (String val) {
                                      _foodItem = val;
                                    }),
                                TextFormField(
                                    controller: quantity,
                                    decoration: const InputDecoration(
                                        hintText: 'Quantity of Food',
                                        hintStyle: TextStyle(
                                            color: Color.primaryColor)),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter quantity of food';
                                      }
                                      return null;
                                    },
                                    onSaved: (String val) {
                                      _quantity = val;
                                    }),
                                SizedBox(
                                  height: 10.0,
                                ),
                                RaisedButton(
                                  color: Color.primaryColor,
                                  textColor: Color.white,
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      if (_dropDownValue == null) {
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('Select the Ngo Name'),
                                        ));
                                      } else {
                                        _formKey.currentState.save();
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                                content:
                                                    Text('Processing Data')));
                                        FirebaseAuthentication.addDonations(
                                            ngoName: _dropDownValue,
                                            address: _address,
                                            date: _date,
                                            time: _time,
                                            foodItem: _foodItem,
                                            quantity: _quantity,
                                            callback: callBack);
                                      }
                                    }
                                  },
                                  child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(child: Text('Donate'))),
                                )
                              ]))
                        ],
                      ))
                ])));
  }
}
