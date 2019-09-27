import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartWidget extends StatefulWidget {
  final Widget child;

  ChartWidget({Key key, this.child}) : super(key: key);

  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  List<charts.Series<OnboardTrack, int>> _seriesLineData;

  _generateData() {
    var predictedData = [
      new OnboardTrack(0, 1),
      new OnboardTrack(1, 25),
      new OnboardTrack(2, 128),
      new OnboardTrack(3, 25),
      new OnboardTrack(4, 1),
      // new OnboardTrack(5, 70),
    ];
    var actualData = [
      new OnboardTrack(0, 3),
      new OnboardTrack(1, 24),
      new OnboardTrack(2, 145),
      new OnboardTrack(3, 48),
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
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          child: charts.LineChart(
            _seriesLineData,
            defaultRenderer: new charts.LineRendererConfig(),
            animate: true,
            animationDuration: Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}

class OnboardTrack {
  int timeVal;
  int stageVal;
  OnboardTrack(this.stageVal, this.timeVal);
}
