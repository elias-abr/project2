import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String _baseUrl = 'https://mobileproj2.000webhostapp.com/';

  static Future<List<dynamic>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/getProducts.php'));
    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      return decodedResponse;
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<void> addItem(String name, String description, String quantity,
      String cost, String price, String image) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/addItem.php'),
      body: {
        'name': name,
        'description': description,
        'quantity': quantity,
        'cost': cost,
        'price': price,
        'image': image,
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add item');
    }
  }
}
