import 'package:flutter/material.dart';

class StageWidget extends StatelessWidget {

TextStyle stageStyle = TextStyle(
  fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black45
);
TextStyle ownerStyle = TextStyle(
  fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black45
);
 final Color predictedColor = Colors.red;
  final Color actualColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text('Stage Name 1', style: stageStyle,), Text('15 Min', style: stageStyle.copyWith(fontSize: 16.0, color: predictedColor))],
          ),
          Padding(padding: EdgeInsets.only(bottom: 4.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text('Customer Success Manager', style: ownerStyle,), Text('15 Min', style: stageStyle.copyWith(fontSize: 16.0, color: actualColor))],
          ),
        ],
      ),
    );
  }
}
