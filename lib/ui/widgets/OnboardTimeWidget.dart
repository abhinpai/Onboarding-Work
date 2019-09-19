import 'package:flutter/material.dart';

class OnboardTimeWidget extends StatelessWidget {
  TextStyle style = TextStyle(
      color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 18.0);
  final Color predictedColor = Colors.red;
  final Color actualColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 8.0, 6.0),
                  child: Text(
                    'Predicted Onboarding TIme',
                    style: style,
                  )),
              Text('24 Hr',
                  style: style.copyWith(color: predictedColor, fontSize: 16.0)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 8.0, 0.0),
                  child: Text(
                    'Time taken so far',
                    style: style,
                  )),
              Text('10 Hr',
                  style: style.copyWith(color: actualColor, fontSize: 16.0)),
            ],
          ),
          // Padding(padding: EdgeInsets.only(bottom: 10.0),)
        ],
      ),
    );
  }
}
