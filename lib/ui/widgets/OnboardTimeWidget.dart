import 'package:flutter/material.dart';

class OnboardTimeWidget extends StatelessWidget {
  TextStyle style = TextStyle(
      color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 18.0);
  final Color predictedColor = Colors.red;
  final Color actualColor = Colors.green;

  dynamic analysis;
  OnboardTimeWidget(this.analysis);

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
              Text(
                  this.analysis.predictedTime != ""
                      ? this.analysis.predictedTime +
                          " " +
                          this.analysis.timeType
                      : '7.12 Day',
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
                    (this.analysis.actualTime == "")
                        ? 'Time taken so far'
                        : 'Actual Onboarding Time',
                    style: style,
                  )),
              Text(
                  (this.analysis.actualTime == "")
                      ? '9.4 Day'
                      : this.analysis.actualTime,
                  style: style.copyWith(color: actualColor, fontSize: 16.0)),
            ],
          ),
        ],
      ),
    );
  }
}
