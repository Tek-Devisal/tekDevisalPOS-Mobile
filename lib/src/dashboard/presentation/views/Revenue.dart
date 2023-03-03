import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kamran/core/common/widgets/DetailedReportCard.dart';
import 'package:kamran/core/utils/colors.dart';
import 'package:kamran/src/dashboard/data/datasource/daily_cashrecieved_remote_data_source.dart';
import 'package:kamran/src/dashboard/data/datasource/daily_goodsborrowed_remote_data_source.dart';
import 'package:kamran/src/dashboard/data/models/dailyCashRecievedModel.dart';
import 'package:kamran/src/dashboard/data/models/dailyGoodsBorrowedModel.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({super.key});

  static const id = '/revenue-page';

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  late Future<List<DailyCashRecievedModel>> cashRecieved;
  late Future<List<DailyGoodsBorrowedModel>> goodsBorrowed;

  @override
  void initState() {
    cashRecieved = fetchDailyCashRecieved(context);
    goodsBorrowed = fetchDailyGoodsBorrowed(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Daily Reports',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<List<DailyCashRecievedModel>>(
                future: cashRecieved,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: DetailedReportCard(
                                dayDescription: 'Amount Received Today',
                                dayAmount:
                                    "GH¢${snapshot.data![index].daily_sales}",
                                weekDescription: 'Amount Received this Week',
                                weekAmount:
                                    "GH¢${snapshot.data![index].weekly_sales}",
                                monthDescription: 'Amount Received this Month',
                                monthAmount:
                                    'GH¢${snapshot.data![index].monthly_sales}',
                                yearDescription: 'Amount Received this Year',
                                yearAmount:
                                    'GH¢${snapshot.data![index].yearly_sales}',
                                heading: 'Cash Received',
                                imageUrl: 'assets/images/payment.png'),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 50,
                        ),
                        Text(
                          "${snapshot.error}",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  // By default show a loading spinner.
                  return SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }),
            FutureBuilder<List<DailyGoodsBorrowedModel>>(
                future: goodsBorrowed,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: DetailedReportCard(
                              dayDescription: 'Amount Borrowed Today',
                              dayAmount:
                                  'GH¢${snapshot.data![index].daily_borrowed}',
                              weekDescription: 'Amount Borrowed this Week',
                              weekAmount:
                                  'GH¢${snapshot.data![index].weekly_borrowed}',
                              monthDescription: 'Amount Borrowed this Month',
                              monthAmount:
                                  'GH¢${snapshot.data![index].monthly_borrowed}',
                              yearDescription: 'Amount Borrowed this Year',
                              yearAmount:
                                  'GH¢${snapshot.data![index].yearly_borrowed}',
                              heading: 'Goods Borrowed',
                              imageUrl: 'assets/images/borrowing.png',
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 50,
                        ),
                        Text(
                          "${snapshot.error}",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  // By default show a loading spinner.
                  return SizedBox(
                      // child: Center(child: CircularProgressIndicator()),
                      );
                }),
          ],
        ),
      ),
    );
  }
}
