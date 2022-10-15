import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class FreeroomsProvider {
  Future<List<String>> getFreeRooms() async {
    // List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter()
    //     .convert(File('assets/freerooms.csv').readAsStringSync());
    final string = await rootBundle.loadString('assets/freerooms.csv');
    List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(string);

    var list = <String>[];
    for (var i = 2; i < rowsAsListOfValues[0].length; i++) {
      // for (var i = 2; i < 10; i++) {
      list.add(rowsAsListOfValues[0][i].toString());
    }

    // print(list);
    // List<String>.of(elements)
    return Future.value(list.toSet().toList());
  }
}
