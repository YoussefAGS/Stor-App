import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storapp/helper/api_helper.dart';
import 'package:storapp/models/ProductModel.dart';

class AllProductServices {
  static Future<List<ProductModel>> getAllProduct() async {
    http.Response response =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<dynamic> json = jsonDecode(response.body);
    int n = json.length;
    List<ProductModel> products = [];
    for (int i = 0; i < n; i++) {
      products.add(ProductModel.fromJson(json[i]));
    }
    return products;
  }

  static Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> response =
        await Api().Post(url: "https://fakestoreapi.com/products", body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category
    });
    return ProductModel.fromJson(response);
  }

  static Future<ProductModel> updateProductService(
      {required int Id,
        required String name,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> response =
        await Api().Put(url:'https://fakestoreapi.com/products/${Id}', body: {
      "title": name,
      "price": price,
      "description": description,
      "image": image,
      "category": category
    });
    return ProductModel.fromJson(response);
  }
}
