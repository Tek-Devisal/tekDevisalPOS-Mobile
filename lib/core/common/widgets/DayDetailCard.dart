import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DayDetailReportCard extends StatelessWidget {
  //final String heading;
  final String date;
  final String day;
  final String cashDescription;
  final String creditDescription;
  final String soldDescription;
  final String returnDescription;
  //final String imageUrl;
  final String cashAmount;
  final String creditAmount;
  final String soldAmount;
  final String returnAmount;

  const DayDetailReportCard({
    super.key,
    //required this.heading,
    //required this.imageUrl,
    required this.date,
    required this.day,
    required this.cashDescription,
    required this.creditDescription,
    required this.soldDescription,
    required this.returnDescription,
    required this.cashAmount,
    required this.creditAmount,
    required this.soldAmount,
    required this.returnAmount,
  });

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
                  // Image(image: AssetImage(imageUrl)),
                  Text(
                    day,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Quicksand_bold",
                    ),
                  ),
                  Spacer(),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Quicksand_regular",
                    ),
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
                  cashDescription,
                  style: TextStyle(
                    fontFamily: "Quicksand_bold",
                  ),
                ),
                const Spacer(),
                Text(
                  cashAmount,
                  style: TextStyle(
                    fontFamily: "Quicksand_regular",
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Text(
                  soldDescription,
                  style: TextStyle(
                    fontFamily: "Quicksand_bold",
                  ),
                ),
                const Spacer(),
                Text(
                  soldAmount,
                  style: TextStyle(
                    fontFamily: "Quicksand_regular",
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Text(
                  returnDescription,
                  style: TextStyle(
                    fontFamily: "Quicksand_bold",
                  ),
                ),
                const Spacer(),
                Text(
                  returnAmount,
                  style: TextStyle(
                    fontFamily: "Quicksand_regular",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
