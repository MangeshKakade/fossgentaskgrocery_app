import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ApiService {
  Future<List<Fruits>> fetchFruits() async {
    final response = await http.get(Uri.parse('https://api.npoint.io/45a6a1dc0dd62b6b2f59'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['fruits'];
      List<Fruits> fruits = data.map((json) => Fruits.fromJson(json)).toList();
      return fruits;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
