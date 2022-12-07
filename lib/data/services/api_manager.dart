import 'dart:convert';

import 'package:dars29/data/model/product_model.dart';
import 'package:http/http.dart'as http;

class ApiManager{

  static Future<ProductsList> getProducts()async{
    Uri url = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return ProductsList.fromJson(data);
  }
}