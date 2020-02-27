import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_food_donation/Helper/data.dart';
import 'package:flutter_food_donation/Helper/db_helper.dart';
import 'package:flutter_food_donation/Helper/ngo_model.dart';
import 'package:flutter_food_donation/screens/ngoList/ngo_profile.dart';

import '../../utils/constants/images.dart';

class AllNgoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllNgoListState();
  }
}

class AllNgoListState extends State<AllNgoList> {
  TextEditingController editingController = TextEditingController();
  Future<List<NgoListModel>> ngoList, duplicateList;
  var dbHelper;
  String query;

  void initState() {
    super.initState();
    dbHelper = DBHelper();
    print('Database and table created');
    Data.dataList.map((value) {
      NgoListModel e = NgoListModel(null, value['name'], value['address']);
      dbHelper.save(e);
    }).toList();
    refreshList();
  }

  refreshList() {
    setState(() {
      ngoList = dbHelper.getNgoList();
    });
  }

  SingleChildScrollView dataTable(List<NgoListModel> ngoList) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: (query == null) ? Text('SUGGESTIONS') : Text('RESULTS'),
          )
        ],
        rows: ngoList
            .map((ngoList) => DataRow(cells: [
                  DataCell(
                    Text(
                      ngoList.name,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).primaryColor),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NgoProfile(
                                (ngoList.name).toString(),
                                (ngoList.address).toString())),
                      );
                    },
                  ),
                ]))
            .toList(),
      ),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future: ngoList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }

          if (null == snapshot.data || snapshot.data.length == 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Text("No Data Found")
              ],
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              child: Image(
                image: NGO_IMAGE,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    ngoList = dbHelper.getFilteredList(value);
                    query = value;
                  });
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Enter your City name",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            list()
          ],
        ),
      ),
    );
  }
}
