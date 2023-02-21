import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kamran/components/DetailedReportCard.dart';
import 'package:kamran/components/RecentReportButton.dart';
import 'package:kamran/components/colors.dart';
import 'package:kamran/screens/HomePage.dart';

class RevenuePage extends StatelessWidget {
  const RevenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const DetailedReportCard(
            dayDescription: 'Amount Received Today',
            dayAmount: 'GH¢ 12,000',
            weekDescription: 'Amount Received this Week',
            weekAmount: 'GH¢ 12,000',
            monthDescription: 'Amount Received this Month',
            monthAmount: 'GH¢ 12,000',
            yearDescription: 'Amount Received this Year',
            yearAmount: 'GH¢12,000',
              heading: 'Cash Received',
              imageUrl: 'assets/payment.png',
        ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: const DetailedReportCard(
            dayDescription: 'Amount Received Today',
            dayAmount: 'GH¢ 12,000',
            weekDescription: 'Amount Received this Week',
            weekAmount: 'GH¢ 12,000',
            monthDescription: 'Amount Received this Month',
            monthAmount: 'GH¢ 12,000',
            yearDescription: 'Amount Received this Year',
            yearAmount: 'GH¢ 12,000',
              heading: 'Goods Borrowed',
              imageUrl: 'assets/borrowing.png',
        ),
    ),
    
    ],
    );
  }
}
