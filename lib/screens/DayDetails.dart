import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kamran/core/common/widgets/DayDetailCard.dart';
import 'package:kamran/core/utils/colors.dart';

class DayDetailsPage extends StatefulWidget {
  DayDetailsPage(
      {super.key,
      required this.day,
      required this.date,
      required this.cashReceived,
      required this.goodSold,
      required this.goodReturned});

  static const id = '/day-details-page';

  final String day;
  final String date;
  final int cashReceived;
  final int goodSold;
  final int goodReturned;

  @override
  State<DayDetailsPage> createState() => _DayDetailsPageState();
}

class _DayDetailsPageState extends State<DayDetailsPage> {
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
                    date: widget.date,
                    day: widget.day,
                    cashDescription: 'Cash Received',
                    creditDescription: 'Goods Borrowed',
                    soldDescription: 'Goods Sold',
                    returnDescription: 'Goods Returned',
                    cashAmount: 'GH¢ ${widget.cashReceived}',
                    creditAmount: 'GH¢ 1,000',
                    soldAmount: widget.goodSold.toString(),
                    returnAmount: widget.goodReturned.toString())),
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
