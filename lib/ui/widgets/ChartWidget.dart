import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartWidget extends StatefulWidget {
  final Widget child;

  ChartWidget({Key key, this.child}) : super(key: key);

  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  TextStyle chartLengendStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0);

  List<charts.Series<OnboardTrack, int>> _seriesLineData;

  _generateData() {
    var predictedData = [
      new OnboardTrack(0, 1),
      new OnboardTrack(1, 26),
      new OnboardTrack(2, 154),
      new OnboardTrack(3, 179),
      new OnboardTrack(4, 180),
    ];
    var actualData = [
      new OnboardTrack(0, 3),
      new OnboardTrack(1, 27),
      new OnboardTrack(2, 172),
      new OnboardTrack(3, 220),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff0033)),
        id: 'Onboarding Workflow Predicted',
        data: predictedData,
        domainFn: (OnboardTrack track, _) => track.stageVal,
        measureFn: (OnboardTrack track, _) => track.timeVal,
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Onboarding Workflow Actual',
        data: actualData,
        domainFn: (OnboardTrack track, _) => track.stageVal,
        measureFn: (OnboardTrack track, _) => track.timeVal,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesLineData = List<charts.Series<OnboardTrack, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: charts.LineChart(
              _seriesLineData,
              defaultRenderer: new charts.LineRendererConfig(),
              animate: true,
              animationDuration: Duration(seconds: 2),
              behaviors: [
                new charts.ChartTitle('Onboarding Stages',
                    titleStyleSpec: charts.TextStyleSpec(fontSize: 12),
                    behaviorPosition: charts.BehaviorPosition.bottom,
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea),
                new charts.ChartTitle('Time (Hr)',
                    titleStyleSpec: charts.TextStyleSpec(fontSize: 12),
                    behaviorPosition: charts.BehaviorPosition.start,
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 10.0,
                      width: 30.0,
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      'Predicted',
                      style: chartLengendStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                    ),
                    Container(
                      height: 10.0,
                      width: 30.0,
                      decoration: new BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      'Actual',
                      style: chartLengendStyle,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}

class OnboardTrack {
  int timeVal;
  int stageVal;
  OnboardTrack(this.stageVal, this.timeVal);
}
