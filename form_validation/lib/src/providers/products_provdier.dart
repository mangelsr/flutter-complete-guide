import 'dart:convert';
import 'dart:io';

import 'package:form_validation/src/preferences/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

import 'package:form_validation/src/models/product_model.dart';

class ProductProvider {
  final UserPreferences _prefs = UserPreferences();
  final String _url = 'https://flutter-86f87.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    final url = '$_url/products.json?auth=${_prefs.token}';
    final response = await http.post(url, body: productModelToJson(product));
    if (response.statusCode == 200) return true;
    return false;
  }

  Future<List<ProductModel>> loadProducts() async {
    final url = '$_url/products.json?auth=${_prefs.token}';
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    if (decodedData == null) return [];
    if (decodedData['error'] != null) return [];
    final List<ProductModel> products = [];
    decodedData.forEach((String id, product) {
      final prodTemp = ProductModel.fromJson(product);
      prodTemp.id = id;
      products.add(prodTemp);
    });
    return products;
  }

  Future<bool> deleteProduct(String id) async {
    final url = '$_url/products/$id.json?auth=${_prefs.token}';
    final response = await http.delete(url);
    if (response.statusCode == 200) return true;
    return false;
  }

  Future<bool> updateProduct(ProductModel product) async {
    final url = '$_url/products/${product.id}.json?auth=${_prefs.token}';
    final response = await http.put(url, body: productModelToJson(product));
    if (response.statusCode == 200) return true;
    return false;
  }

  Future<String> uploadImage(File image) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dczryx0yx/image/upload?upload_preset=naaobgkr');
    final mimeType = mime(image.path).split('/');
    final request = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', image.path,
        contentType: MediaType(mimeType[0], mimeType[1]));
    request.files.add(file);
    final stramResponse = await request.send();
    final resp = await http.Response.fromStream(stramResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Something went wrong');
      print(resp.body);
      throw Exception('Uploaded failed');
    }
    final respData = json.decode(resp.body);
    print(respData);
    return respData['secure_url'];
  }
}
