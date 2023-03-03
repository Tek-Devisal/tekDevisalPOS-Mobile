import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReturnDetailReportCard extends StatelessWidget {
  //final String heading;
  final String date;
  final String day;
  final String returnAmount;
  final String returnNumber;

  const ReturnDetailReportCard({
    super.key,
    //required this.heading,
    //required this.imageUrl,
    required this.date,
    required this.day,
    required this.returnAmount,
    required this.returnNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
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
                  // Image(image: AssetImage(imageUrl)),
                  Text(
                    date,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    day,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Text(
                  'Amount Returned: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  returnAmount,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Text(
                  'Products Returned:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  returnNumber,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
