import 'product_model.dart';

class ShopProductModel {
  final int id;
  final String name;
  final String selfLink;
  final double? price;
  final String? unit;

  ShopProductModel({
    required this.id,
    required this.name,
    required this.selfLink,
    this.price,
    this.unit,
  });

  String get imageUrl => 'https://api.predic8.de/shop/v2/products/$id/image';

  factory ShopProductModel.fromJson(Map<String, dynamic> json) {
    return ShopProductModel(
      id: json['id'],
      name: json['name'],
      selfLink: json['self_link'] ?? '',
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      unit: json['unit'],
    );
  }

  ProductModel toProductModel() {
    return ProductModel(
      id: id,
      title: name,
      price: price ?? 0.0,
      description: 'Unit: ${unit ?? "N/A"}',
      image: imageUrl,
      category: 'Shop',
    );
  }
}
