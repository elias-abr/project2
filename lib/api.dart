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
}
