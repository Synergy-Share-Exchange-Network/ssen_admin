import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/helper_function.dart';

class LineChartgraph extends StatefulWidget {
  const LineChartgraph({Key? key}) : super(key: key);

  @override
  _LineChartgraphState createState() => _LineChartgraphState();
}

class _LineChartgraphState extends State<LineChartgraph> {
  // crate list of spots for the graph by monthly, yearly of Google Stocks
  // late List<FlSpot> _daylySpots;
  late List<String> _xLabelsDay;
  late List<String> _xLabelsMonth;
  late List<String> _xLabelsYear;
  late List<List<int>> _monthIndexes;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<FlSpot> _dailySpots = [];
  List<FlSpot> _monthlySpots = [];
  List<FlSpot> _yearlySpots = [];
  int _currentIndex = 0;
  bool _isLoading = true;
  int limit = 10;

  @override
  void initState() {
    super.initState();
    fetchData();
    // _daylySpots = _generateRandomData();
    _xLabelsDay = _generateXLabelsDay();
    _xLabelsMonth = _generateXLabelsMonth();
    _xLabelsYear = _generateXLabelsYear(5);
  }

  List<FlSpot> calculateMonthValues(
      List<dynamic> selesData, List<List<int>> monthIndexes) {
    List<FlSpot> monthlySpots = [];

    for (int i = 0; i < monthIndexes.length; i++) {
      List<int> indexes = monthIndexes[i];
      double totalSales = 0;

      for (int j = indexes[0]; j <= indexes[1]; j++) {
        totalSales += selesData[j];
      }

      double averageSales = totalSales / (indexes[1] - indexes[0] + 1);
      monthlySpots.add(FlSpot(i.toDouble(), totalSales));
    }

    return monthlySpots;
  }

  List<List<int>> calculateMonthIndexes(List<String> dates) {
    List<List<int>> monthIndexes = [];
    int currentYear = -1;
    int currentMonth = -1;
    int monthStartIndex = 0;

    for (int i = 0; i < dates.length; i++) {
      DateTime date = DateTime.parse(dates[i]);
      int year = date.year;
      int month = date.month;

      if (currentYear != year || currentMonth != month) {
        if (currentYear != -1 && currentMonth != -1) {
          // Mark the end index of the previous month
          monthIndexes.add([monthStartIndex, i - 1]);
        }
        // Mark the start index of the current month
        monthStartIndex = i;
      }

      currentYear = year;
      currentMonth = month;
    }

    // Mark the end index of the last month
    monthIndexes.add([monthStartIndex, dates.length - 1]);

    return monthIndexes;
  }

  Future<void> fetchData() async {
    try {
      DocumentSnapshot primaryDoc = await _firestore
          .collection('ML_data')
          .doc('companies')
          .collection('c2')
          .doc('primary')
          .get();

      if (primaryDoc.exists) {
        Map<String, dynamic>? data = primaryDoc.data() as Map<String, dynamic>?;

        if (data != null) {
          List<dynamic> dates = data['dates'] ?? [];
          List<dynamic> seles = data['seles'] ?? [];
          _monthIndexes = calculateMonthIndexes(dates.cast<String>());
          print(_monthIndexes);
          List<FlSpot> monthValues = calculateMonthValues(seles, _monthIndexes);
          print(monthValues);

          if (dates.length == seles.length) {
            List<FlSpot> spotsDay = [];
            List<FlSpot> spotsMonth = [];

            int ini = 0;
            for (int i = dates.length - limit; i < dates.length; i++, ini++) {
              spotsDay.add(FlSpot(ini.toDouble(), seles[i].toDouble()));
            }
            // for (int i = dates.length; i < dates.length; i++, ini++) {
            //   spotsMonth.add(FlSpot(ini.toDouble(), seles[i].toDouble()));
            // }
            setState(() {
              _dailySpots = spotsDay;
              _monthlySpots = monthValues;

              _isLoading = false;
              print(_dailySpots);
            });
          } else {
            print('Mismatch in length between dates and seles');
            setState(() {
              _isLoading = false;
            });
          }
        } else {
          print('No data found in primary document.');
          setState(() {
            _isLoading = false;
          });
        }
      } else {
        print('Primary document does not exist.');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<String> _generateXLabelsDay() {
    List<String> labels = [];
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < limit; i++) {
      DateTime date = currentDate.subtract(Duration(days: i));
      String formattedDate = DateFormat('MMM-dd').format(date);
      labels.add(formattedDate);
    }

    print(labels);
    return labels.reversed.toList();
  }

  List<String> _generateXLabelsMonth() {
    List<String> labels = [];
    DateTime currentDate = DateTime.now();

    for (int i = 0; i < 6; i++) {
      DateTime date = currentDate.subtract(
          Duration(days: i * 30)); // Subtracting months instead of days
      String formattedDate =
          DateFormat('MMM-yy').format(date); // Format as month-year
      labels.add(formattedDate);
    }
    print(labels);
    return labels.reversed
        .toList(); // Reversing the list to display from oldest to newest
  }

  List<String> _generateXLabelsYear(int limit) {
    List<String> labels = [];
    DateTime currentDate = DateTime.now();

    for (int i = 0; i < limit; i++) {
      DateTime date = DateTime(currentDate.year - i, 1,
          1); // Create a date for January 1st of the respective year
      String formattedDate = DateFormat('yyyy').format(date); // Format as year
      labels.add(formattedDate);
    }
    print(labels);
    return labels.reversed
        .toList(); // Reversing the list to display from oldest to newest
  }

  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          from: 30,
          child: const Text(
            '+1.5%',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 50),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          from: 60,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: LineChart(
                mainData(),
                swapAnimationCurve: Curves.easeInOutCubic,
                swapAnimationDuration: const Duration(milliseconds: 1000),
              )),
        ),
        AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: MediaQuery.of(context).size.height * 0.3,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _currentIndex == 0
                          ? const Color(0xff161b22)
                          : const Color(0xff161b22).withOpacity(0.0),
                    ),
                    child: Text(
                      "D",
                      style: TextStyle(
                          color: _currentIndex == 0
                              ? Colors.blueGrey.shade200
                              : Colors.blueGrey,
                          fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _currentIndex == 1
                          ? const Color(0xff161b22)
                          : const Color(0xff161b22).withOpacity(0.0),
                    ),
                    child: Text(
                      "M",
                      style: TextStyle(
                          color: _currentIndex == 1
                              ? Colors.blueGrey.shade200
                              : Colors.blueGrey,
                          fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _currentIndex == 2
                          ? const Color(0xff161b22)
                          : const Color(0xff161b22).withOpacity(0.0),
                    ),
                    child: Text(
                      "Y",
                      style: TextStyle(
                          color: _currentIndex == 2
                              ? Colors.blueGrey.shade200
                              : Colors.blueGrey,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            )),
      ]),
    );
  }

  // Charts Data
  List<Color> gradientColors = [
    Colors.blue,
    Colors.blue,
  ];

  LineChartData mainData() {
    List<FlSpot> spots = _currentIndex == 0
        ? _dailySpots
        : _currentIndex == 1
            ? _monthlySpots
            : _currentIndex == 2
                ? _yearlySpots
                : _dailySpots;
    double maxY = 0;
    double minX;
    double maxX;
    if (_currentIndex == 0) {
      int startIndex = (_dailySpots.length > 10) ? _dailySpots.length - 10 : 0;
      int endIndex = _dailySpots.length - 1;
      minX = 0;
      for (int i = startIndex; i <= endIndex; i++) {
        if (_dailySpots[i].y > maxY) {
          maxY = _dailySpots[i].y;
        }
      }
      maxX = _dailySpots.length - 1.toDouble();
    } else if (_currentIndex == 1) {
      int startIndex =
          (_monthlySpots.length > 1) ? _monthlySpots.length - 5 : 0;
      int endIndex = _monthlySpots.length - 1;
      for (int i = startIndex; i <= endIndex; i++) {
        if (_monthlySpots[i].y > maxY) {
          maxY = _dailySpots[i].y;
        }
      }
      minX = 0;
      maxX = _xLabelsMonth.length - 1.toDouble();
    } else if (_currentIndex == 2) {
      minX = 0;
      maxX = _xLabelsYear.length - 1.toDouble();
    } else {
      minX = 0;
      maxX = spots.length.toDouble();
    }
    return LineChartData(
      borderData: FlBorderData(
        show: true,
      ),
      gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          horizontalInterval: 10,
          drawVerticalLine: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: true),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 8),
          getTitles: (value) {
            if (_currentIndex == 0) {
              // Assuming daily data
              int index = value.toInt();
              // switch (value.toInt()) {
              //! display dates in mmm-dd form
              if (index >= 0 && index < _xLabelsDay.length) {
                return _xLabelsDay[index];
              }
              // Add more cases as needed
            } else if (_currentIndex == 1) {
              int index = value.toInt();
              // Assuming monthly data
              // switch (value.toInt()) {
              //   //!
              // }
              if (index >= 0 && index < _xLabelsMonth.length) {
                return _xLabelsMonth[index];
              }
            } else if (_currentIndex == 2) {
              // Assuming yearly data
              int index = value.toInt();
              // return '${(value + 10).toInt()}';
              if (index >= 0 && index < _xLabelsYear.length) {
                return _xLabelsYear[index];
              }
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
        ),
      ),
      minX: minX,
      maxX: maxX,
      minY: 0,
      maxY: maxY,
      lineTouchData: LineTouchData(
          getTouchedSpotIndicator:
              (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((index) {
              return TouchedSpotIndicatorData(
                FlLine(
                  color: Colors.white.withOpacity(0.1),
                  strokeWidth: 2,
                  dashArray: [3, 3],
                ),
                FlDotData(
                  show: false,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                    radius: 8,
                    color: [
                      Colors.black,
                      Colors.black,
                    ][index],
                    strokeWidth: 2,
                    strokeColor: Colors.black,
                  ),
                ),
              );
            }).toList();
          },
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipPadding: const EdgeInsets.all(8),
            tooltipBgColor: const Color(0xff2e3747).withOpacity(0.8),
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((touchedSpot) {
                return LineTooltipItem(
                  '\$${touchedSpot.y.round()}.00',
                  const TextStyle(color: Colors.white, fontSize: 12.0),
                );
              }).toList();
            },
          ),
          handleBuiltInTouches: true),
      lineBarsData: [
        LineChartBarData(
          spots: _currentIndex == 0
              ? _dailySpots
              : _currentIndex == 1
                  ? _monthlySpots
                  : _currentIndex == 2
                      ? _yearlySpots
                      : _dailySpots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,
              gradientFrom: const Offset(0, 0),
              gradientTo: const Offset(0, 1),
              colors: [
                Colors.blue.withOpacity(0.1),
                Colors.blue.withOpacity(0),
              ]),
        )
      ],
    );
  }
}
