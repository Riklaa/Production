import 'dart:convert';
import 'package:http/http.dart' as http;

class HistoryModel {
  String name;
  String status;
  bool boxIsSelected;

  HistoryModel(
      {required this.name, required this.status, required this.boxIsSelected});

  static Future<List<HistoryModel>> getHistory() async {
    List<HistoryModel> history = [];
    var url = Uri.parse('http://192.168.1.12/production/viewdata.php');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var item in data) {
        history.add(HistoryModel(
          name: item['name'],
          status: item['status'],
          boxIsSelected: true,
        ));
      }
    } else {
      throw Exception('Failed to load data');
    }

    return history;
  }
}
