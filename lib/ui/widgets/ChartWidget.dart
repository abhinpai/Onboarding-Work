import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';

class ChartWidhget extends StatelessWidget {  final fromDate = DateTime(2012, 11, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 300));
  final date4 = DateTime.now().subtract(Duration(days: 320));

  final date5 = DateTime.now().subtract(Duration(days: 650));
  final date6 = DateTime.now().subtract(Duration(days: 652));
  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 200.0,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: BezierChart(
        bezierChartScale: BezierChartScale.YEARLY,
        fromDate: fromDate,
        toDate: toDate,
        selectedDate: toDate,
        series: [
          BezierLine(
            label: "Actual",
            onMissingValue: (dateTime) {
              if (dateTime.year.isEven) {
                return 20.0;
              }
              return 5.0;
            },
            data: [
              DataPoint<DateTime>(value: 10, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
              DataPoint<DateTime>(value: 100, xAxis: date3),
              DataPoint<DateTime>(value: 100, xAxis: date4),
              DataPoint<DateTime>(value: 40, xAxis: date5),
              DataPoint<DateTime>(value: 47, xAxis: date6),
            ],
          ),
          BezierLine(
            label: "Predicted",
            lineColor: Colors.black26,
            onMissingValue: (dateTime) {
              if (dateTime.month.isEven) {
                return 10.0;
              }
              return 3.0;
            },
            data: [
              DataPoint<DateTime>(value: 20, xAxis: date1),
              DataPoint<DateTime>(value: 30, xAxis: date2),
              DataPoint<DateTime>(value: 150, xAxis: date3),
              DataPoint<DateTime>(value: 80, xAxis: date4),
              DataPoint<DateTime>(value: 45, xAxis: date5),
              DataPoint<DateTime>(value: 45, xAxis: date6),
            ],
          ),
        ],
        config: BezierChartConfig(
          // pinchZoom: true,
          showDataPoints: true,
          // backgroundColor: Colors.white,
          bubbleIndicatorColor: Colors.white,
          
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          backgroundGradient: LinearGradient(
            colors: [
              Colors.red[300],
              Colors.red[400],
              Colors.red[400],
              Colors.red[500],
              Colors.red,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          footerHeight: 30.0,
        ),
      ),
    );
  }

  // final List<charts.Series> seriesList;
  // final bool animate;

  // ChartWidhget(this.seriesList, {this.animate});

  // /// Creates a [LineChart] with sample data and no transition.
  // factory ChartWidhget.withSampleData() {
  //   return new ChartWidhget(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return new charts.NumericComboChart(seriesList,
  //       animate: animate,
  //       // Configure the default renderer as a line renderer. This will be used
  //       // for any series that does not define a rendererIdKey.
  //       defaultRenderer: new charts.LineRendererConfig(),
  //       // Custom renderer configuration for the point series.
  //       customSeriesRenderers: [
  //         new charts.PointRendererConfig(
  //             // ID used to link series to this renderer.
  //             customRendererId: 'customPoint')
  //       ]);
  // }

  // /// Create one series with sample hard coded data.
  // static List<charts.Series<LinearSales, int>> _createSampleData() {
  //   final mobileSalesData = [
  //     new LinearSales(0, 10),
  //     new LinearSales(1, 50),
  //     new LinearSales(2, 200),
  //     new LinearSales(3, 150),
  //   ];

  //   return [
  //     new charts.Series<LinearSales, int>(
  //         id: 'Mobile',
  //         colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
  //         domainFn: (LinearSales sales, _) => sales.year,
  //         measureFn: (LinearSales sales, _) => sales.sales,
  //         data: mobileSalesData)
  //       // Configure our custom point renderer for this series.
  //       ..setAttribute(charts.rendererIdKey, 'customPoint'),
  //   ];
  // }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
