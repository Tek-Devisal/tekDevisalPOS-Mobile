import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:intl/intl.dart';
import 'package:kamran/core/common/widgets/recentReturnButton.dart';
import 'package:kamran/src/returns/presentation/views/ReturnDetail.dart';
import 'package:kamran/src/dashboard/data/datasource/returns_remote_data_source.dart';
import 'package:kamran/src/dashboard/data/models/returnModel.dart';

class ReturnsPage extends StatefulWidget {
  const ReturnsPage({super.key});

  static const id = '/returns-page';

  @override
  State<ReturnsPage> createState() => _ReturnsPageState();
}

class _ReturnsPageState extends State<ReturnsPage> {
  late Future<List<ReturnModel>> fetchAllReturns;

  @override
  void initState() {
    fetchAllReturns = fetchReturns(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: const Text(
              'Recent Returns',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder<List<ReturnModel>>(
                future: fetchAllReturns,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              padding: const EdgeInsets.all(10),
                              child: RecentReturnButton(
                                  onPressIt: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReturnsDetailsPage(
                                                  day: snapshot
                                                      .data![index].date,
                                                  date: DateFormat('EEEE')
                                                      .format(DateTime.parse(
                                                          snapshot.data![index]
                                                              .date))
                                                      .toString())),
                                    );
                                  },
                                  day: snapshot.data![index].date,
                                  date: DateFormat('EEEE')
                                      .format(DateTime.parse(
                                          snapshot.data![index].date))
                                      .toString()));
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
          ),
        ],
      ))
    ]));
  }
}
