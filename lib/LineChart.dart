/**
 * This is used to show the line chart of week number vs number of cases
 * Reference for adding markers to line chart: https://github.com/google/charts/issues/58
 * 
 * @author: Aratrika Pal
 * 
 */

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_app/PreviousCases.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;

int casesNo = 0;

class Config {
  static List<PreviousCases> _chartDataList = [];
  static bool _loaded = false;
  static isLoaded() {
    return _loaded;
  }

  static loadChartDataList() async {
    Response response = await get(
        'https://data.gov.sg/api/action/datastore_search?resource_id=c6db5eb2-6daf-4d3b-b571-7bc16c8f03c4&limit=35');

    Map dengueData = jsonDecode(response.body);
    List dengueCases = dengueData['result']['records'];
    print(dengueCases);
    for (int i = 0; i < dengueCases.length; i++) {
      if (dengueCases[i]['type_dengue'] == 'Dengue') {
        _chartDataList.add(PreviousCases(int.parse(dengueCases[i]['eweek']),
            int.parse(dengueCases[i]['number'])));
      }
    }
    _loaded = true;
  }

  static getChartDataList() {
    if (!_loaded) loadChartDataList();
    return _chartDataList;
  }
}

class LineChartPage extends StatefulWidget {
  _LineChartPageState createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  List<charts.Series<PreviousCases, int>> _chartDataSeries = [];
  List<PreviousCases> chartDataList = [];
  Widget lineChart = Text("Loading ...");

  @override
  Widget build(BuildContext context) {
    // this is where i use Config class to perform my asynchronous load data
    // and check if it's loaded so this section will occur only once
    if (!Config.isLoaded())
      Config.loadChartDataList().then((value) =>

          // call the setState() to tell flutter that it should re-evaluate the widget tree based
          // on this code changing the state of the class (the vars i.e. lineChart) and decide if
          // it wants to redraw, this is the reason to put lineChart as a var of the class
          // so when it changes - it changes the class state
          setState(() {
            print("Finished loading Json config from web!");
            chartDataList = Config.getChartDataList();

            // construct you'r chart data series
            _chartDataSeries.add(
              charts.Series(
                colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.blue),
                id: 'My test Chart',
                data: chartDataList,
                domainFn: (PreviousCases pointModel, _) => pointModel.week,
                measureFn: (PreviousCases pointModel, _) => pointModel.number,
              ),
            );

            // now change the 'Loading...' widget with the real chart widget
            lineChart = charts.LineChart(_chartDataSeries,
                defaultRenderer: new charts.LineRendererConfig(
                    includeArea: true, stacked: true, includePoints: true),
                animate: true,
                domainAxis: new charts.NumericAxisSpec(
                    viewport: new charts.NumericExtents(
                        chartDataList[0].week - 1,
                        chartDataList[chartDataList.length - 1].week + 3)),
                animationDuration: Duration(seconds: 2),
                selectionModels: [
                  SelectionModelConfig(changedListener: (SelectionModel model) {
                    if (model.hasDatumSelection) {
                      casesNo = model.selectedSeries[0]
                          .measureFn(model.selectedDatum[0].index);
                      print(model.selectedSeries[0]
                          .measureFn(model.selectedDatum[0].index));
                    }
                  })
                ],
                behaviors: [
                  LinePointHighlighter(
                      symbolRenderer: CustomCircleSymbolRenderer()),
                  new charts.ChartTitle('Week Number',
                      behaviorPosition: charts.BehaviorPosition.bottom,
                      titleOutsideJustification:
                          charts.OutsideJustification.middleDrawArea),
                  new charts.ChartTitle('Number of Cases',
                      behaviorPosition: charts.BehaviorPosition.start,
                      titleOutsideJustification:
                          charts.OutsideJustification.middleDrawArea),
                ]);
          }));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){Config._loaded=false;
          Navigator.pop(context,true);},

        ),
        title: Text(
          'SG Dengue Cases: Trend',
          style: TextStyle(
            letterSpacing: 1.5,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Column(children: [
              Expanded(
                child: lineChart,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
        Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 20,
            bounds.height + 10),
        fill: Color.white);
    var textStyle = style.TextStyle();
    textStyle.color = Color.black;
    textStyle.fontSize = 15;
    canvas.drawText(TextElement("$casesNo", style: textStyle),
        (bounds.left).round(), (bounds.top - 28).round());
  }
}
