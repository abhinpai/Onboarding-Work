import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:onboarding/model/data_model.dart';
import 'package:onboarding/services/onboardingAPI.dart';
import 'package:onboarding/ui/widgets/ChartWidget.dart';
import 'package:onboarding/ui/widgets/OnboardTimeWidget.dart';
import 'package:onboarding/ui/widgets/SiteDataWidget.dart';
import 'package:onboarding/ui/widgets/StageAnalysisWidget.dart';

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
  initState() {
    super.initState();
    this.getSiteStatus();

    onBackPress = () {
      Navigator.of(context).pop();
    };
  }

  Future<DataModel> getSiteStatus() async {
    final url = 'https://onboard.free.beeceptor.com/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return DataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to site data');
    }
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            SiteDataWidget(),
            SizedBox(height: 20.0),
            ChartWidhget(),
            SizedBox(height: 20.0),
            OnboardTimeWidget(),
            SizedBox(height: 20.0),
            StageAnalysisWidget()
          ],
        ));
  }
}
