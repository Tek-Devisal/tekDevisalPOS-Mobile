import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:tekDevisalPOS/core/common/widgets/RecentReportButton.dart';
import 'package:tekDevisalPOS/core/utils/colors.dart';
import 'package:tekDevisalPOS/screens/DayDetails.dart';
import 'package:tekDevisalPOS/src/dashboard/data/datasource/daily_sales_remote_data_source.dart';
import 'package:tekDevisalPOS/src/dashboard/data/models/dailySalesModel.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  static const id = '/report-page';

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late Future<List<DailySalesModel>> futureData;

  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  @override
  void initState() {
    futureData = fetchDailySales(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 50),
            child: SwipeRefresh.material(
              stateStream: _stream,
              onRefresh: _refresh,
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                Center(
                  child: Text(
                    'Recent Reports',
                    style: TextStyle(
                        fontFamily: "Quicksand_bold",
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
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
                            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                                              builder: (context) =>
                                                  DayDetailsPage(
                                                    day: DateFormat('EEEE')
                                                        .format(DateTime.parse(
                                                            snapshot
                                                                .data![index]
                                                                .date))
                                                        .toString(),
                                                    date: snapshot
                                                        .data![index].date,
                                                    goodSold: snapshot
                                                        .data![index].goodsSold,
                                                    cashReceived: snapshot
                                                        .data![index]
                                                        .totalSales,
                                                    goodReturned: snapshot
                                                        .data![index]
                                                        .goodsReturned,
                                                  )),
                                        );
                                      },
                                    );
                                  });
                            } else if (snapshot.hasError) {
                              return Column(
                                children: [
                                  Image.asset(
                                    "assets/images/sales.png",
                                    height: 100,
                                    width: 100,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    "${snapshot.error}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Quicksand_regular"),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Image.asset(
                                    "assets/images/sales.png",
                                    height: 100,
                                    width: 100,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    "No Sales yet.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Quicksand_regular",
                                    ),
                                  ),
                                ],
                              );
                            }
                          }),
                    )),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> _refresh() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    setState(() {
      futureData = fetchDailySales(context);
    });
    // when all needed is done change state

    _controller.sink.add(SwipeRefreshState.hidden);
  }
}
