import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:kamran/core/common/widgets/recentReturnButton.dart';
import 'package:kamran/screens/ReturnDetail.dart';

class ReturnsPage extends StatelessWidget {
  const ReturnsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: const Text(
              'Recent Returns',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child:  RecentReturnButton(day: 'Invoice Number', date: '27/09/2022',
             onPressIt: (){
              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReturnsDetailsPage()),
                          );
             },
              
              )
              
              ),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
          Container(
              padding: const EdgeInsets.all(10),
              child: const RecentReturnButton(day: 'Invoice Number', date: '27/09/2022')),
        ],
      ))
    ]));
  }
}
