import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nutrition_app/models/product.dart';

class Api {
  static const String url = 'https://world.openfoodfacts.org/api/v3/product/';

  static Future<Product> getData(String barcode) async {
    var response = await http.get(Uri.parse('$url$barcode'));

    Map<String, dynamic> data = json.decode(response.body);
    if (response.statusCode == 404) {
      throw ProductNotFoundException();
    }
    if (response.statusCode != 200) {
      throw ApiException(response.body, response.statusCode);
    }

    return Product.fromJson(data['product']);
  }
}

class ProductNotFoundException implements Exception {
  ProductNotFoundException();
}

class ApiException implements Exception {
  final String message;
  final int statusCode;

  ApiException(this.message, this.statusCode);
}
