class ReturnDetailsModel {
  final int totalAmountPaid;
  final int totalItemsSold;
  // final String shop_id;

  ReturnDetailsModel({required this.totalAmountPaid, required this.totalItemsSold});

  factory ReturnDetailsModel.fromJson(Map<String, dynamic> json) {
    return ReturnDetailsModel(
      totalAmountPaid: json['totalAmountPaid'],
      totalItemsSold: json['totalItemsSold'],
      // shop_id: json['shop_id'],
    );
  }
}
