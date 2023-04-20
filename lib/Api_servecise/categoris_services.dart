import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helper/api_helper.dart';
import '../models/ProductModel.dart';
class AllCategoriesServices {
  static Future<List<dynamic>> getAllCategories() async {

    http.Response response=await Api().get(url: 'https://fakestoreapi.com/products/categories');
    List<dynamic>json=jsonDecode(response.body);
    return json;



  }
  static Future<List<ProductModel>> getCategoriesProduct({required String categoryName }) async {

    http.Response response=await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<dynamic>json=jsonDecode(response.body);
    int n=json.length;
    List<ProductModel>products=[];
    for(int i=0;i<n;i++){
      products.add(ProductModel.fromJson(json[i]));
    }
    return products;



  }

}