import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:onboarding/model/data_model.dart';
import 'package:onboarding/services/LocalPreference.dart';
import 'package:onboarding/ui/widgets/ChartWidget.dart';
import 'package:onboarding/ui/widgets/OnboardTimeWidget.dart';
import 'package:onboarding/ui/widgets/SiteDataWidget.dart';
import 'package:onboarding/ui/widgets/StageWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String siteId;
  VoidCallback onBackPress;
  _DashboardState();
  LocalPreference pref = LocalPreference();

  @override
  initState() {
    super.initState();
    onBackPress = () {
      Navigator.of(context).pop();
    };
    getSiteId();
  }

  getSiteId() async {
    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('siteId');
    setState(() {
      siteId = id;
    });
    print(siteId);
  }

  Future<DataModel> _getData() async {
    final url = 'https://trackerinsights.azurewebsites.net/api/getSiteInfo?siteid=madhan';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return DataModel.fromJson(jsonData);
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
        ),
        body: Container(
          child: FutureBuilder(
            future: _getData(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.data == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView(
                  padding: EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    SiteDataWidget(snap.data.siteName, snap.data.siteId,
                        snap.data.systemType),
                    SizedBox(height: 20.0),
                    ChartWidhget(),
                    SizedBox(height: 20.0),
                    OnboardTimeWidget(snap.data.analysis),
                    SizedBox(height: 20.0),
                    createListView(context, snap)
                  ],
                );
              }
            },
          ),
        ));
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    TextStyle titleStyle = TextStyle(
        fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);
    dynamic values = snapshot.data.analysis.stages;
    final title = 'Stage Wise Onbaording Status';
    
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: titleStyle,
            ),
            SizedBox(
              height: 10.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.analysis.stages.length,
              itemBuilder: (context, int index) {
                if (values == null) {
                  return Text('Loading...');
                } else {
                  var x = values[index];
                  print(x);
                  return StageWidget(values[index]);
                }
              },
              padding: EdgeInsets.only(top: 10.0),
            )
          ],
        ));
  }
}
