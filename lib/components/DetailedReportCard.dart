import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailedReportCard extends StatelessWidget {
  final String heading;
  final String dayDescription;
  final String weekDescription;
  final String monthDescription;
  final String yearDescription;
  final String imageUrl;
  final String dayAmount;
  final String weekAmount;
  final String monthAmount;
  final String yearAmount;

  const DetailedReportCard(
      {super.key,
      required this.heading,
      required this.dayDescription,
      required this.imageUrl,
      required this.dayAmount,
      required this.weekAmount,
      required this.monthAmount, required this.weekDescription, required this.monthDescription, required this.yearDescription, required this.yearAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: ListView(
          padding: EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 50,
              child: Row(
                children: [
                  Image(image: AssetImage(imageUrl)),
                  Text(
                    heading,
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              children: [Text(dayDescription), const Spacer(), Text(dayAmount)],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [Text(weekDescription), const Spacer(), Text(weekAmount)],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [Text(monthDescription), const Spacer(), Text(monthAmount)],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [Text(yearDescription), const Spacer(), Text(yearAmount)],
            ),
          ],
        ),
      ),
    );
  }
}
