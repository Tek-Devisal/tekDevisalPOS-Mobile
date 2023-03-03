class ReturnModel {
  // final String id;
  final String date;
  // final String shop_id;

  ReturnModel({required this.date});

  factory ReturnModel.fromJson(Map<String, dynamic> json) {
    return ReturnModel(
      // id: json['_id'],
      date: json['date'],
      // shop_id: json['shop_id'],
    );
  }
}
