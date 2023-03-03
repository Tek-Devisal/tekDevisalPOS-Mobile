class ProductModel {
  final String id;
  final String store_id;
  final String name;
  final int price;
  final int selling_price;
  final int total_stock;
  final int discount;
  final String image;
  // final String createdAt;
  // final String updatedAt;

  ProductModel({
    required this.id,
    required this.store_id,
    required this.name,
    required this.price,
    required this.selling_price,
    required this.total_stock,
    required this.discount,
    required this.image,
    // required this.createdAt,
    // required this.updatedAt
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      store_id: json['store_id'],
      name: json['name'],
      price: json['price'],
      selling_price: json['selling_price'],
      total_stock: json['total_stock'],
      discount: json['discount'],
      image: json['image'],
      // goodsReturned: json['createdAt'],
      // goodsReturned: json['updatedAt'],
    );
  }
}
