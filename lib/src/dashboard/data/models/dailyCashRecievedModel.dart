class DailyCashRecievedModel {
  final int daily_sales;
  final int weekly_sales;
  final int monthly_sales;
  final int yearly_sales;

  DailyCashRecievedModel(
      {required this.daily_sales,
      required this.weekly_sales,
      required this.monthly_sales,
      required this.yearly_sales});

  factory DailyCashRecievedModel.fromJson(Map<String, dynamic> json) {
    return DailyCashRecievedModel(
      daily_sales: json['daily_sales'],
      weekly_sales: json['weekly_sales'],
      monthly_sales: json['monthly_sales'],
      yearly_sales: json['yearly_sales'],
    );
  }
}
