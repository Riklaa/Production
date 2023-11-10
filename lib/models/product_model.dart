import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductModel {
  String name;
  String status;
  bool boxIsSelected;

  ProductModel(
      {required this.name, required this.status, required this.boxIsSelected});

  static Future<List<ProductModel>> getProductmodel() async {
    List<ProductModel> products = [];
    var url = Uri.parse('http://192.168.1.12/production/viewdata.php');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var item in data) {
        if (item['status'] == 'ongoing') {
          // Memeriksa status ongoing
          products.add(ProductModel(
            name: item['name'],
            status: item['status'],
            boxIsSelected: true,
          ));
        } else if (item['status'] == 'finished') {
          // Memeriksa status finished
          products.add(ProductModel(
            name: item['name'],
            status: item['status'],
            boxIsSelected: true,
          ));
        } else if (item['status'] == 'canceled') {
          // Memeriksa status canceled
          products.add(ProductModel(
            name: item['name'],
            status: item['status'],
            boxIsSelected: true,
          ));
        }
      }
    } else {
      throw Exception('Failed to load data');
    }

    return products;
  }
}
