class DailySalesModel {
  final String date;
  final int goodsSold;
  final int totalSales;
  final int goodsReturned;

  DailySalesModel(
      {required this.date,
      required this.goodsSold,
      required this.totalSales,
      required this.goodsReturned});

  factory DailySalesModel.fromJson(Map<String, dynamic> json) {
    return DailySalesModel(
      date: json['_id'],
      goodsSold: json['goods_sold'],
      totalSales: json['totalSales'],
      goodsReturned: json['goods_returned'],
    );
  }
}
