import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/post.dart';
import 'package:flutter_food_donation/providers/post.dart';
import 'package:provider/provider.dart';
import '../../utils/colors/colors.dart';

import '../../utils/constants/images.dart';

class NgoProfile extends StatefulWidget {
  final String name, address;
  NgoProfile(this.name, this.address);
  @override
  State<StatefulWidget> createState() {
    return NgoProfileState(name, address);
  }
}

class NgoProfileState extends State {
  final PostProvider postProvider = PostProvider();
  final String name, address;
  NgoProfileState(this.name, this.address);
  Widget _buildCoverImage(BuildContext context, Size screenSize) {
    return Stack(
      children: <Widget>[
        Container(
          height: screenSize.height / 4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NGO_COVER,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Positioned(
        //   width: 50,
        //   right: 5,
        //   bottom: 0,
        //   child: RaisedButton(
        //     color: Theme.of(context).primaryColor,
        //     child: Icon(
        //       Icons.photo_camera,
        //       size: 20,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {},
        //   ),
        // )
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Center(
        child: Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NGO_PROFILE,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(80.0),
        border: Border.all(
          color: Colors.white,
          width: 5.0,
        ),
      ),
    ));
  }

  Widget _buildUserName(String username) {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      username,
      style: _nameTextStyle,
    );
  }

  Widget _buildBio(BuildContext context, String bio) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).primaryColor,
      fontSize: 16.0,
    );

    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8.0),
      child: Text(
        bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildDetailsItem(BuildContext context, IconData icon, String info) {
    TextStyle _infoStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    );
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 10, 20),
          ),
          Text(
            (info.split(',').length == 4)
                ? (info.split(',')[0] +
                    ',' +
                    info.split(',')[1] +
                    ',' +
                    info.split(',')[2] +
                    ' \n${info.split(',')[3]}')
                : info,
            style: _infoStyle,
          )
        ],
      ),
    );
  }

  Widget _buildPersonalDetails(
      BuildContext context, String name, String address) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildDetailsItem(context, Icons.person, name),
          _buildDetailsItem(context, Icons.home, address),
          _buildDetailsItem(
              context, Icons.email, name.split(' ')[0] + '@gmail.com'),
          _buildDetailsItem(context, Icons.phone, '+91-8210076789'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(name),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.primaryColor,
                    Colors.limeAccent,
                  ])),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Stack(
              children: <Widget>[
                _buildCoverImage(context, screenSize),
                Column(
                  children: <Widget>[
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? SizedBox(height: 150)
                        : SizedBox(height: 50),
                    _buildProfileImage(context),
                  ],
                )
              ],
            ),
          ])),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      _buildUserName(name),
                      _buildBio(context, 'Greeting from "$name"'),
                      Container(
                          child: _buildPersonalDetails(context, name, address)),
                    ],
                  ))
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var postProvider = Provider.of<PostProvider>(context);
                postProvider.setPostImage(NGO_PROFILE);
                postProvider.setPostName(name);
                postProvider.setPostIndex(index);
                return Post('ngo');
              },
              childCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
