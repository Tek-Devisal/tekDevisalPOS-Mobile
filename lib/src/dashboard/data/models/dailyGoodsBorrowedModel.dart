class DailyGoodsBorrowedModel {
  final int daily_borrowed;
  final int weekly_borrowed;
  final int monthly_borrowed;
  final int yearly_borrowed;

  DailyGoodsBorrowedModel(
      {required this.daily_borrowed,
      required this.weekly_borrowed,
      required this.monthly_borrowed,
      required this.yearly_borrowed});

  factory DailyGoodsBorrowedModel.fromJson(Map<String, dynamic> json) {
    return DailyGoodsBorrowedModel(
      daily_borrowed: json['daily_borrowed'],
      weekly_borrowed: json['weekly_borrowed'],
      monthly_borrowed: json['monthly_borrowed'],
      yearly_borrowed: json['yearly_borrowed'],
    );
  }
}
