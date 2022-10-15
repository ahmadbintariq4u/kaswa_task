import 'dart:io';

import 'package:csv/csv.dart';

class FreeroomsProvider {
  List<String> getFreeRooms() {
    var file = "assets/freerooms.csv";

    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter()
        .convert(File('assets/freerooms.csv').readAsStringSync());

    var list = <String>[];
    for (var i = 2; i < rowsAsListOfValues[0].length; i++) {
      // for (var i = 2; i < 10; i++) {
      list.add(rowsAsListOfValues[0][i].toString());
    }

    // print(list);
    // List<String>.of(elements)
    return list.toSet().toList();
  }
}
