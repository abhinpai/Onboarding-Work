import 'package:flutter/material.dart';

import 'StageWidget.dart';

class StageAnalysisWidget extends StatelessWidget {
  final title = 'Stage Wise Onbaording Status';
  TextStyle titleStyle = TextStyle(
      fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: titleStyle,
          ),
          ListView(
            padding: EdgeInsets.only(top: 10.0),
            shrinkWrap: true,
            children: <Widget>[
             StageWidget(),
             StageWidget()
            ],
          )
        ],
      ),
    );
  }
}
