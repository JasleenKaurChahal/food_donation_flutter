import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carousal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    height: 200.0,
    width: 350.0,
    child: Carousel(
      images: [
        NetworkImage('https://s7641.pcdn.co/wp-content/uploads/2019/03/FEATURED-Heres-How-to-Accept-Donations-Through-Your-WordPress-Site.jpeg'),
        NetworkImage('https://www.cvartscouncil.com/wp-content/uploads/2016/04/donation.jpg'),
        NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRcg_BtM4vq28gbPG6mUZfsCEW79984CFY3v-4ksbQ1OCctt29-'),
        NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSGF23QdIzruz8qQr5u1upH6-hxUzMvl8rHu0FUAw6p68o4qN4q'),
        NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTupRUTJrSocJfsbcj5xHLjxKi4HasJD7utUbjbfoHNXPdR9N_V')
      ],
      dotSize: 4.0,
      dotSpacing: 15.0,
      dotColor: Colors.lightGreenAccent,
      indicatorBgPadding: 5.0,
      dotBgColor: Colors.white.withOpacity(0.5),
      borderRadius: true,
      moveIndicatorFromBottom: 180.0,
      noRadiusForIndicator: true,
    )
    );
  }
}