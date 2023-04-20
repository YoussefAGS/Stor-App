import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storapp/models/ProductModel.dart';

class Api {
  Future<http.Response> get({required String url, String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({
        'Authorization': "Bearer $token",
      });
    }
    http.Response response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('the problem is ${response.statusCode}');
    }
  }

  Future<dynamic> Post(
      {required String url, dynamic body, String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({
        'Authorization': "Bearer $token",
      });
    }

    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: header);
    Map<String, dynamic> json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return json;
    } else {
      throw Exception('the problem is ${response.statusCode}');
    }
  }

  Future<dynamic> Put(
      {required String url, dynamic body, String? token}) async {
    Map<String, String> header = {};
    header.addAll({
      'Content-Type': "application/x-www-form-urlencoded",
    });
    if (token != null) {
      header.addAll({
        'Authorization': "Bearer $token",
      });
    }

    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('the problem is ${response.statusCode}');
    }
  }
}
