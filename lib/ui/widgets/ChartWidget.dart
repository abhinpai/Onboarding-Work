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
      new OnboardTrack(1, 10),
      new OnboardTrack(2, 58),
      new OnboardTrack(3, 67),
      new OnboardTrack(4, 68),
      // new OnboardTrack(5, 70),
    ];
    var actualData = [
      new OnboardTrack(0, 3),
      new OnboardTrack(1, 11),
      new OnboardTrack(2, 60),
      new OnboardTrack(3, 76),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff0033)),
        id: 'Onboarding Workflow',
        data: predictedData,
        domainFn: (OnboardTrack track, _) => track.stageVal,
        measureFn: (OnboardTrack track, _) => track.timeVal,
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Onboarding Workflow',
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
