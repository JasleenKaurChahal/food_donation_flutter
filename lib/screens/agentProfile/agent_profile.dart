import 'package:flutter/material.dart';
import 'package:flutter_food_donation/components/post.dart';
import 'package:flutter_food_donation/providers/agent_profile.dart';
import 'package:flutter_food_donation/providers/post.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/images.dart';

class AgentProfile extends StatelessWidget {
  Widget _buildCoverImage(BuildContext context, Size screenSize) {
    return Stack(
      children: <Widget>[
        Container(
          height: screenSize.height / 4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: COVER_IMAGE,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          width: 50,
          right: 5,
          bottom: 0,
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Icon(
              Icons.photo_camera,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 140.0,
            height: 140.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AGENT_IMAGE,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(80.0),
              border: Border.all(
                color: Colors.white,
                width: 5.0,
              ),
            ),
          ),
          Positioned(
            width: 50,
            right: 0,
            bottom: 0,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.photo_camera),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
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

  Widget _buildStatus(BuildContext context, String status) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(count,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusContainer(String experience, String rating) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("Experience", experience + ' years'),
          _buildStatItem("Rating", rating + '.0 ' + '⭐'),
        ],
      ),
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

  Widget _buildDetailsItem(
      BuildContext context, IconData icon, String label, String info) {
    TextStyle _labelStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20.0,
    );
    TextStyle _infoStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    );
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        ),
        Text(
          label,
          style: _labelStyle,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 10, 20),
        ),
        Text(
          info,
          style: _infoStyle,
        )
      ],
    );
  }

  Widget _buildProffessonalDetails(BuildContext context, String timeShift,
      String transport, String vehicleNumber) {
    return Column(
      children: <Widget>[
        _buildDetailsItem(
            context, Icons.access_time, 'Time Shift: ', timeShift),
        _buildDetailsItem(
            context, Icons.directions_bike, 'Transport used: ', transport),
        _buildDetailsItem(context, Icons.confirmation_number,
            'Vehicle Number: ', vehicleNumber),
      ],
    );
  }

  Widget _buildPersonalDetails(BuildContext context, String workedAt,
      String emailAddress, String phoneNumber) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildDetailsItem(context, Icons.work, 'Workes At: ', workedAt),
          _buildDetailsItem(
              context, Icons.email, 'EmailAddress: ', emailAddress),
          _buildDetailsItem(
              context, Icons.phone, 'Contact Number: ', phoneNumber),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight:
                  (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? screenSize.height / 3
                      : screenSize.height / 2,
              flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                children: <Widget>[
                  _buildCoverImage(context, screenSize),
                  Column(
                    children: <Widget>[
                      (MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? SizedBox(height: 150)
                          : SizedBox(height: 50),
                      _buildProfileImage(context),
                    ],
                  )
                ],
              )),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  child: Consumer<AgentProfileProvider>(
                      builder: (context, agentProfileProvider, child) {
                    return Column(
                      children: <Widget>[
                        _buildUserName(
                            agentProfileProvider.agentProfileModel.userName),
                        _buildStatus(context,
                            agentProfileProvider.agentProfileModel.status),
                        _buildStatusContainer(
                            agentProfileProvider.agentProfileModel.experience,
                            agentProfileProvider.agentProfileModel.rating),
                        _buildBio(context,
                            agentProfileProvider.agentProfileModel.bio),
                        Card(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              _buildPersonalDetails(
                                  context,
                                  agentProfileProvider
                                      .agentProfileModel.workedAt,
                                  agentProfileProvider
                                      .agentProfileModel.emailAddress,
                                  agentProfileProvider
                                      .agentProfileModel.phoneNumber),
                              _buildProffessonalDetails(
                                  context,
                                  agentProfileProvider
                                      .agentProfileModel.timeShift,
                                  agentProfileProvider
                                      .agentProfileModel.transport,
                                  agentProfileProvider
                                      .agentProfileModel.vehicleNumber),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                )
              ]),
            ),
            Consumer<AgentProfileProvider>(
                builder: (context, agentProfileProvider, child) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    var postProvider = Provider.of<PostProvider>(context);
                    postProvider.setPostName(
                        agentProfileProvider.agentProfileModel.userName);
                    postProvider.setPostIndex(index);
                    postProvider.setPostImage(AGENT_IMAGE);
                    return Post('agent');
                  },
                  childCount: 5,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
