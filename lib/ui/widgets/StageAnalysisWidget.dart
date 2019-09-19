import 'package:flutter/material.dart';
import 'package:onboarding/ui/pages/Dashboard.dart';

import 'StageWidget.dart';

class StageAnalysisWidget extends StatelessWidget {
  final title = 'Stage Wise Onbaording Status';
  TextStyle titleStyle = TextStyle(
      fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);

  dynamic stageDatas;
  BuildContext context;
  AsyncSnapshot snap;

  StageAnalysisWidget(this.context, this.snap);

  @override
  Widget build(BuildContext context) {
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
          ],
        ));
  }
}
