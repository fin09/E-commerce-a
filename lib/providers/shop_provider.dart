import 'package:flutter/material.dart';
import '../models/shop_product_model.dart';
import '../services/shop_api_service.dart';

class ShopProvider with ChangeNotifier {
  final ShopApiService _apiService = ShopApiService();
  List<ShopProductModel> _products = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';

  List<ShopProductModel> get products {
    if (_searchQuery.isEmpty) {
      return _products;
    }
    return _products
        .where((p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  bool get isLoading => _isLoading;
  String? get error => _error;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> loadProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _apiService.fetchProducts();
      // Optionally fetch details for each to get prices, but let's start with basic list
      // and show how to load more if needed.
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
