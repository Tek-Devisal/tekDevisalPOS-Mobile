import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kamran/core/common/widgets/DayDetailCard.dart';
import 'package:kamran/core/utils/colors.dart';
import 'package:kamran/screens/HomePage.dart';

class DayDetailsPage extends StatelessWidget {
  const DayDetailsPage({super.key});

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
                child: DayDetailReportCard(
                    date: '27/09/2022',
                    day: 'Thursday',
                    cashDescription: 'Cash Received',
                    creditDescription: 'Goods Borrowed',
                    soldDescription: 'Goods Sold',
                    returnDescription: 'Goods Returned',
                    cashAmount: 'GH¢ 2,000',
                    creditAmount: 'GH¢ 1,000',
                    soldAmount: '20',
                    returnAmount: '2')),
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
