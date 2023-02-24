import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReturnDetailReportCard extends StatelessWidget {
  //final String heading;
  final String date;
  final String invoiceNumber;
  final String returnNumDescription;
  final String productName;
  final String productSupplier;
  final String returnDescription;
  //final String imageUrl;
  final String returnAmount;
  final String returnNumber;

  const ReturnDetailReportCard({
    super.key,
    //required this.heading,
    //required this.imageUrl,
    required this.date,
    required this.invoiceNumber,
    required this.returnNumDescription,
    required this.productName,
    required this.returnDescription,
    required this.returnAmount,
    required this.returnNumber,
    required this.productSupplier,
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
                    invoiceNumber,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    date,
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
                  'Product Name: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  productName,
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
                  'Product Supplier:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  productSupplier,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Text(returnDescription),
                const Spacer(),
                Text(returnAmount)
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Text(returnNumDescription),
                const Spacer(),
                Text(returnNumber)
              ],
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
