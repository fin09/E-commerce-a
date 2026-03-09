import 'package:dio/dio.dart';
import '../models/shop_product_model.dart';

class ShopApiService {
  static const String baseUrl = 'https://api.predic8.de';
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<ShopProductModel>> fetchProducts() async {
    try {
      final response = await _dio.get(
        '/shop/v2/products',
        queryParameters: {
          'start': 2,
          'limit': 100,
          'price': '<9.90',
          'sort': 'name',
          'order': 'asc',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> productsJson = response.data['products'];
        return productsJson
            .map((json) => ShopProductModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  Future<ShopProductModel> fetchProductDetails(int id) async {
    try {
      final response = await _dio.get('/shop/v2/products/$id');

      if (response.statusCode == 200) {
        return ShopProductModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load product details');
      }
    } catch (e) {
      throw Exception('Error fetching product details: $e');
    }
  }
}
