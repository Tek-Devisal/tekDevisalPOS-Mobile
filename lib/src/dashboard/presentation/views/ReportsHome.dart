import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:kamran/core/common/widgets/RecentReportButton.dart';
import 'package:kamran/core/utils/colors.dart';
import 'package:kamran/screens/DayDetails.dart';
import 'package:kamran/src/dashboard/data/datasource/daily_sales_remote_data_source.dart';
import 'package:kamran/src/dashboard/data/models/dailySalesModel.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  static const id = '/report-page';

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late Future<List<DailySalesModel>> futureData;

  @override
  void initState() {
    futureData = fetchDailySales(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 50),
          child: Text(
            'Recent Reports',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              child: FutureBuilder<List<DailySalesModel>>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RecentReportButton(
                              day: DateFormat('EEEE')
                                  .format(DateTime.parse(
                                      snapshot.data![index].date))
                                  .toString(),
                              date: snapshot.data![index].date,
                              onPressIt: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DayDetailsPage(
                                            day: DateFormat('EEEE')
                                                .format(DateTime.parse(
                                                    snapshot.data![index].date))
                                                .toString(),
                                            date: snapshot.data![index].date,
                                            goodSold:
                                                snapshot.data![index].goodsSold,
                                            cashReceived: snapshot
                                                .data![index].totalSales,
                                            goodReturned: snapshot
                                                .data![index].goodsReturned,
                                          )),
                                );
                              },
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
            )),
      ],
    ));
  }
}
