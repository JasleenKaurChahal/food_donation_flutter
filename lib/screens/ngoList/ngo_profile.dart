import 'package:flutter/material.dart';
import 'package:flutter_food_donation/providers/user_profile.dart';
import 'package:provider/provider.dart';

import '../../components/app_bar.dart';

class NgoProfile extends StatefulWidget {
  final String name, address;
  NgoProfile(this.name, this.address);
  @override
  State<StatefulWidget> createState() {
    return NgoProfileState(name, address);
  }
}

class NgoProfileState extends State {
  final String name, address;
  NgoProfileState(this.name, this.address);

  Widget _buildProfileImage(BuildContext context) {
    return Center(
        child: Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/user1.jpg'),
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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      _buildProfileImage(context),
                      _buildUserName(name),
                      _buildBio(context, 'Greeting from $name'),
                      Container(
                          child: _buildPersonalDetails(context, name, address)),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/images/user1.jpg')),
                              ),
                            ),
                            new SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: new TextField(
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Add a Post...",
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ]),
          ),
          Consumer<UserProfileProvider>(
              builder: (context, userProfileProvider, child) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image(
                              height: 50,
                              width: 50,
                              image:
                                  AssetImage('assets/images/cover_image.png'),
                            ),
                            Text(userProfileProvider.userProfileModel.userName)
                          ],
                        ),
                        Container(
                          child: Text(userProfileProvider
                              .userProfileModel.posts[index]),
                        )
                      ],
                    ),
                  );
                },
                childCount: userProfileProvider.userProfileModel.posts.length,
              ),
            );
          })
        ],
      ),
    );
  }
}
