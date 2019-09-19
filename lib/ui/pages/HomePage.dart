import 'package:flutter/material.dart';
import 'package:onboarding/services/LocalPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }


LocalPreference pref = LocalPreference();
  final String logo = 'assets/images/logo.png';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController _siteIdctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final siteIdTextField = TextField(
      controller: _siteIdctrl,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Enter Site ID',
          border: OutlineInputBorder()),
    );

    final statusBtn = Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Color(0xffdd1f2d),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        onPressed: () {
          pref.setSiteId(_siteIdctrl.text);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Dashboard()));
                  _siteIdctrl.clear();
        },
        child: Text(
          'Get Site Status',
          textAlign: TextAlign.center,
          style: style.copyWith(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              child: Padding(
            padding: EdgeInsets.fromLTRB(26.0, 100.0, 26.0, 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    logo,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 45.0,
                  child: siteIdTextField,
                ),
                SizedBox(
                  height: 25.0,
                ),
                statusBtn
              ],
            ),
          )),
        ),
      ),
    );
  }
}
