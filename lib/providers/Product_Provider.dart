import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/modelProducts.dart';

class ProductProvider {
  final url = Uri.parse("https://fakestoreapi.com/products");

  Future<List<ModelosProducts>> getProducts() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);
      List<ModelosProducts> products = [];

      for (var item in jsonData) {
        products.add(ModelosProducts(
          item["title"],
          item['price'].toDouble(),
          item['description'],
          item['category'],
          item['image'],
          ProductRating(
            rate: item['rating']['rate'].toDouble(),
            count: item['rating']['count'],
          ),
        ));
      }

      return products;
    } else {
      throw Exception("Falló la conexión");
    }
  }
}
