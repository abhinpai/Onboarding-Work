import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:onboarding/model/data_model.dart';

class Dashboard extends StatefulWidget {
  final String siteId;
  Dashboard(this.siteId);
  @override
  _DashboardState createState() => _DashboardState(this.siteId);
}

class _DashboardState extends State<Dashboard> {
  String siteId;
  VoidCallback onBackPress;
  _DashboardState(this.siteId);

  @override
  void initState() {
    super.initState();

    onBackPress = () {
      Navigator.of(context).pop();
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: onBackPress,
        ),
        // title: new Text("Title"),
      ),
      body: Container(
        child: FutureBuilder<DataModel>(
  future: fetchSiteData(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(snapshot.data.siteName);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }

    // By default, show a loading spinner.
    return CircularProgressIndicator();
  },
),
      ),
    );
  }

  Future<DataModel> fetchSiteData() async {
    final response =
        await http.get('https://onboard.free.beeceptor.com/');

    // if (response.statusCode == 200) {
    //   // If server returns an OK response, parse the JSON.
    //   return DataModel.fromJson(json.decode(response.body));
    // } else {
    //   // If that response was not OK, throw an error.
    //   throw Exception('Failed to site data');
    // }
  }
}
