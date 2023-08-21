import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  Future getProduct() async {
    final productUrl = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(productUrl);
    print(response.statusCode);
    return jsonDecode(response.body);
  }

  Future getSingleProduct(int id) async {
    final productUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(productUrl);
    return jsonDecode(response.body);
  }
}
