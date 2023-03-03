import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kamran/core/common/widgets/ReturnDetailCard.dart';
import 'package:kamran/core/utils/colors.dart';
import 'package:kamran/src/dashboard/data/datasource/return_details_remote_data_source.dart';
import 'package:kamran/src/dashboard/data/models/returnDetailsModel.dart';

class ReturnsDetailsPage extends StatefulWidget {
  const ReturnsDetailsPage({super.key, required this.date, required this.day});

  static const id = '/returns-details-page';
  final String date;
  final String day;

  @override
  State<ReturnsDetailsPage> createState() => _ReturnsDetailsPageState();
}

class _ReturnsDetailsPageState extends State<ReturnsDetailsPage> {
  late Future<List<ReturnDetailsModel>> fetchAllReturnDetails;

  @override
  void initState() {
    fetchAllReturnDetails = fetchReturnDetails(context);
    super.initState();
  }

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
            FutureBuilder<List<ReturnDetailsModel>>(
                future: fetchAllReturnDetails,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: ReturnDetailReportCard(
                                day: widget.day,
                                date: widget.date,
                                returnNumber:
                                    '${snapshot.data![index].totalItemsSold}',
                                returnAmount:
                                    'GH¢ ${snapshot.data![index].totalAmountPaid}',
                              ),
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
                    child: Center(child: CircularProgressIndicator()),
                  );
                }),
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
