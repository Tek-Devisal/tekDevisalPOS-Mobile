import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kamran/core/common/widgets/RecentReportButton.dart';
import 'package:kamran/core/utils/colors.dart';
import 'package:kamran/screens/DayDetails.dart';
import 'package:kamran/screens/HomePage.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              'Recent Reports',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022', 
              onPressIt: (){
                 Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DayDetailsPage()),
                          );
              },)),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
          Container(
              padding: EdgeInsets.all(10),
              child: RecentReportButton(day: 'Thursday', date: '27/09/2022')),
        ],
      ))
    ]));
  }
}
