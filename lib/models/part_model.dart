import 'dart:convert';
import 'package:http/http.dart' as http;

class PartModel {
  String name;
  String status;
  String lot;
  String partname;
  String shift;
  bool boxIsSelected;

  PartModel({
    required this.name,
    required this.status,
    required this.lot,
    required this.partname,
    required this.shift,
    required this.boxIsSelected,
  });

  static Future<List<PartModel>> getPartModel() async {
    List<PartModel> parts = [];
    var url = Uri.parse('http://192.168.1.12/production/viewdata.php');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var item in data) {
        parts.add(PartModel(
          name: item['name'],
          status: item['status'],
          lot: item['lot'],
          partname: item['part'],
          shift: item['shift'],
          boxIsSelected: true,
        ));
      }
    } else {
      throw Exception('Failed to load data');
    }

    return parts;
  }
}
