import 'package:flutter/material.dart';
// import 'package:flutter_food_donation/routes/constants.dart';
import 'package:flutter_food_donation/screens/dashboard/donation_form.dart';
import 'package:flutter_food_donation/utils/constants/images.dart';
import '../../utils/colors/colors.dart';

class Timeline extends StatelessWidget {
  void donate(context) {
    // Navigator.pushNamed(context, donateFormRoute);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DonationForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          //SizedBox(height: 10.0,),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    //image: ADD_DONATION_IMAGE,
                    //image:FOOD_SHARING_IMAGE,
                    //image:SAVE_FOOD_LOGO,
                    image: LOGO,
                    fit: BoxFit.fill)),
          ),
          //SizedBox(height: 10.0,),
          Text(
            'Want To Share Food?',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Color.primaryColor,
              fontSize: 25.0,
              // fontFamily: 'Raleway',
              // fontWeight: FontWeight.w300,
              // fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Choose one!',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Color.grey,
              fontSize: 15.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Color.primaryColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FOOD_ICON, fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Donate',
                    style: TextStyle(color: Color.black, fontSize: 18.0),
                  ),
                  Text('Choose to self donate',
                      style: TextStyle(color: Color.grey)),
                ],
              ),
              SizedBox(
                width: 30.0,
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.primaryColor, width: 2.0),
                        // color: Color.primaryColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NGO_AGENT, fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'NGO Agent',
                    style: TextStyle(color: Color.black, fontSize: 18.0),
                  ),
                  Text('Call an NGO Agent to donate',
                      style: TextStyle(color: Color.grey)),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                //color: Color.primaryColor,
                //shape: BoxShape.circle,
                image:
                    DecorationImage(image: NEED_FOOD, fit: BoxFit.fitHeight)),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              onPressed: () {
                donate(context);
              },
              textColor: Colors.white,
              color: Color.primaryColor,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "I want to Donate",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
