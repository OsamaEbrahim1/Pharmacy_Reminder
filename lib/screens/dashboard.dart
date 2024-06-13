import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:reminder_app/screens/add_item.dart';
import 'package:reminder_app/screens/calender.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/setting.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static String id = 'Dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

int index = 0;

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 243, 243),
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: const BackButton(color: Color(0xFF295c82)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Expiry Items By Days :',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        color: const Color(0xFFee8524),
                        child: const Center(
                            child: Text(
                          "4",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        color: const Color(0xFFececec),
                        child: const Center(child: Text("expire in 1 day")),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        color: const Color(0xFF79c519),
                        child: const Center(
                            child: Text(
                          "10",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        color: const Color(0xFFececec),
                        child: const Center(child: Text("expire in 3 days")),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        color: const Color(0xFFe508cf),
                        child: const Center(
                            child: Text(
                          "15",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        color: const Color(0xFFececec),
                        child: const Center(child: Text("expire in 7 days")),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        color: const Color(0xFF2737c6),
                        child: const Center(
                            child: Text(
                          "20",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        color: const Color(0xFFececec),
                        child: const Center(child: Text("expire in 20 days")),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 80),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    color: const Color(0xFFdc0d0d),
                    child: const Center(
                        child: Text(
                      "29",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: const Color(0xFFececec),
                    child: const Center(child: Text("expire in 30 days")),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Items Expiry Graph :',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Container(
                width: 300,
                height: 230,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 30),
                    child: Container(
                      width: 300,
                      child: BarChart(
                        BarChartData(
                          titlesData: FlTitlesData(
                            leftTitles: SideTitles(showTitles: false),
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'Pills';
                                  case 1:
                                    return 'Syrup';
                                  case 2:
                                    return 'Injections';
                                  case 3:
                                    return 'Body Care';
                                  case 4:
                                    return 'Hair Care';
                                  case 5:
                                    return 'Skin Care';
                                  default:
                                    return '';
                                }
                              },
                            ),
                          ),
                          borderData: FlBorderData(show: true),
                          gridData: FlGridData(
                            show: true,
                            horizontalInterval: 6.0,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Colors.grey,
                                strokeWidth: 1,
                              );
                            },
                          ),
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(
                                    y: 30,
                                    width: 10,
                                    colors: [const Color(0xFF295c82)]),
                              ],
                            ),
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(
                                    y: 10,
                                    width: 10,
                                    colors: [const Color(0xFF295c82)]),
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(
                                    y: 20,
                                    width: 10,
                                    colors: [const Color(0xFF295c82)]),
                              ],
                            ),
                            BarChartGroupData(
                              x: 3,
                              barRods: [
                                BarChartRodData(
                                    y: 40,
                                    width: 10,
                                    colors: [const Color(0xFF295c82)]),
                              ],
                            ),
                            BarChartGroupData(
                              x: 4,
                              barRods: [
                                BarChartRodData(
                                    y: 27,
                                    width: 10,
                                    colors: [const Color(0xFF295c82)]),
                              ],
                            ),
                            BarChartGroupData(
                              x: 5,
                              barRods: [
                                BarChartRodData(
                                    y: 5,
                                    width: 10,
                                    colors: [const Color(0xFF295c82)]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Nearly Expire By Category :',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        color: const Color(0xFFee8524),
                        child: const Center(
                            child: Text(
                          "4",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        color: const Color(0xFFececec),
                        child: const Center(child: Text("Hair Care")),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        color: const Color(0xFF79c519),
                        child: const Center(
                            child: Text(
                          "10",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        color: const Color(0xFFececec),
                        child: const Center(child: Text("Pills")),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          color: const Color(0xFFdc0d0d),
                          child: const Center(
                              child: Text(
                            "20",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          color: const Color(0xFFececec),
                          child: const Center(child: Text("Body Care")),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
