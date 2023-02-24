import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kamran/core/common/widgets/ReturnDetailCard.dart';
import 'package:kamran/core/utils/colors.dart';
import 'package:kamran/screens/HomePage.dart';


class ReturnsDetailsPage extends StatelessWidget {
  const ReturnsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TheColors.buttonColor,
        actions: [Icon(Icons.download)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: ReturnDetailReportCard(
                  productName: 'Hunk (TATA)',
                  productSupplier: 'A&B Fertilizer Wholesaler',
                  invoiceNumber: '1234567',
                    date: '27/09/2022',
                    returnNumDescription: 'Number Returned',
                    returnNumber: '20',
                    returnDescription: 'Goods Returned',
                    returnAmount: 'GH¢ 200000',               
                    ),
                    ),
            TextButton(
                onPressed: () {},
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: TheColors.buttonColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Download Full Report',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
