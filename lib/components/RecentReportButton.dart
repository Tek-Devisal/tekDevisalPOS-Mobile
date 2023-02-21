// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecentReportButton extends StatelessWidget {
  final String day;
  final String date;
  final onPressIt;
  const RecentReportButton({
    Key? key,
    required this.day,
    required this.date,
    this.onPressIt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressIt,
        child: Card(
          elevation: 2,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.document_scanner)),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      day,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )),
                Spacer(),
                Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      date,
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ),
        ));
  }
}
