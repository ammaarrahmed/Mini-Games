import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenFoodFactsAPI {
  static const String _baseUrl = "https://world.openfoodfacts.org/api/v0/product";

  // Fetch product data by barcode
  static Future<Map<String, dynamic>?> fetchProduct(String barcode) async {
    final url = '$_baseUrl/$barcode.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 1) {
          return data['product'];
        }
      }
    } catch (e) {
      print("Error fetching product: $e");
    }
    return null;
  }
}
