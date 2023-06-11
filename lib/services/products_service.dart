import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_challenge/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'dummyjson.com';
  final List<Product> products = [];
  late Product selectedProduct;

  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      final url = Uri.https(_baseUrl, '/products');
      final response = await http.get(url);

      final data = jsonDecode(response.body);

      final body = (data['products'] as List)
          .cast<Map<dynamic, dynamic>>()
          .map((e) => e.cast<String, dynamic>())
          .toList();

      log('get: ${response.statusCode}');
      products.addAll(body.map((e) => Product.fromMap(e)).toList());

      isLoading = false;
      notifyListeners();

      return products;
    } catch (e) {
      isLoading = false;
      notifyListeners();

      log(e.toString());
      return [];
    }
  }

  Future<bool> loginUser(
    String user,
    String password,
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      // final url = Uri.https(_baseUrl, '/auth/login');
      // final response = await http.post(
      //   url,
      //   body: {'user': user, 'password': password},
      // );

      // log('login: ${response.statusCode}');

      if (user != 'kminchelle' || password != '0lelplR') return false;

      isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      isLoading = false;
      notifyListeners();

      log(e.toString());
      return false;
    }
  }
}
