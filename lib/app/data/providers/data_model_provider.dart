import 'package:http/http.dart' as http;

import '../models/data_model_model.dart';

class DataModelProvider {
  Future<DataModel> getData() async {
    final response = await http.get(Uri.parse(
        'https://datausa.io/api/data?drilldowns=Nation&measures=Population'));
    if (response.statusCode == 200) {
      // print(response.body.toString());
      return DataModel.fromJson(response.body.toString());
    } else {
      throw Exception('Failed to load data');
    }
  }
}
