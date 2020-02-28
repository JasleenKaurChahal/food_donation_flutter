import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/app_bar.dart';
import 'package:flutter_food_donation/screens/dashboard/carousal.dart';
import 'package:flutter_food_donation/utils/constants/images.dart';
import '../utils/colors/colors.dart';

class ContactUs extends StatelessWidget {
  Widget _buildContactUs(BuildContext context) {
    return Container(
      margin: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? EdgeInsets.all(10.0)
          : EdgeInsets.fromLTRB(100, 10, 100, 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color.primaryColor, width: 2.0),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Color.primaryColor, width: 2.0),
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AGENT_IMAGE, fit: BoxFit.fill)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'John',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Banglore',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16))),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'CEO',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Column(
                children: <Widget>[
                  Text('Phone: 864527108', style: TextStyle(fontSize: 16)),
                  Text('Email: John@food.com', style: TextStyle(fontSize: 16))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(0),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: 10.0),
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              Text(
                'Contact Us',
                style: TextStyle(color: Color.primaryColor, fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Carousal(),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    _buildContactUs(context),
                    _buildContactUs(context)
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              //Text("Giving money to those in need can be a personally satisfying experience, but there is a choice between donating nationally and internationally through charities or giving directly to those around you. This essay will consider the merits of both approaches. The first advantage of providing direct support is that you can know exactly how your money is being spent. For example, if you give money directly to people in your local village or town, you can see where it has gone. When you donate to larger charitable organisations, on the other hand, you are not sure how much will actually be given to those in need as opposed going on other costs such as administration and expensive marketing campaigns. Another benefit is that you can see the impacts on those you are helping, which can lead not only to great personal satisfaction but also to respect from others in the local community who appreciate the work you do.There are advantages, however, in giving to charities that are national and international. First and foremost there is the choice of good causes. Locally the kinds of places to help may be limited, but in larger organisations you can get involved in such activities as sponsoring a child or conserving wildlife. Not only this, donating to larger charities with an international reach means having the knowledge that you are involved in issues of fundamental global importance, such as curing diseases and human rights, or helping those caught up in tragic environmental events, such as flooding, earthquakes and famines. In conclusion, given the benefits of both, I would argue that an individual should make their own choice based on their personal preferences and whichever provides them with the most personal satisfaction. What is crucial is that we continue to give to those who are more in need than ourselves.",style: TextStyle(color: Color.black,fontSize: 15.0),textAlign: TextAlign.center,)
            ],
          ),
        ));
  }
}
