// To parse this JSON data, do
//
//     final dataModel = dataModelFromMap(jsonString);

import 'dart:convert';

class DataModel {
  DataModel({
    required this.data,
    required this.source,
  });

  final List<Datum> data;
  final List<Source> source;

  factory DataModel.fromJson(String str) => DataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        source: List<Source>.from(json["source"].map((x) => Source.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "source": List<dynamic>.from(source.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.idNation,
    required this.nation,
    required this.idYear,
    required this.year,
    required this.population,
    required this.slugNation,
  });

  final String idNation;
  final String nation;
  final int idYear;
  final String year;
  final int population;
  final String slugNation;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        idNation: json["ID Nation"],
        nation: json["Nation"],
        idYear: json["ID Year"],
        year: json["Year"],
        population: json["Population"],
        slugNation: json["Slug Nation"],
      );

  Map<String, dynamic> toMap() => {
        "ID Nation": idNation,
        "Nation": nation,
        "ID Year": idYear,
        "Year": year,
        "Population": population,
        "Slug Nation": slugNation,
      };
}

class Source {
  Source({
    required this.measures,
    required this.annotations,
    required this.name,
    required this.substitutions,
  });

  final List<String> measures;
  final Annotations annotations;
  final String name;
  final List<dynamic> substitutions;

  factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        measures: List<String>.from(json["measures"].map((x) => x)),
        annotations: Annotations.fromMap(json["annotations"]),
        name: json["name"],
        substitutions: List<dynamic>.from(json["substitutions"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "measures": List<dynamic>.from(measures.map((x) => x)),
        "annotations": annotations.toMap(),
        "name": name,
        "substitutions": List<dynamic>.from(substitutions.map((x) => x)),
      };
}

class Annotations {
  Annotations({
    required this.sourceName,
    required this.sourceDescription,
    required this.datasetName,
    required this.datasetLink,
    required this.tableId,
    required this.topic,
    required this.subtopic,
  });

  final String sourceName;
  final String sourceDescription;
  final String datasetName;
  final String datasetLink;
  final String tableId;
  final String topic;
  final String subtopic;

  factory Annotations.fromJson(String str) =>
      Annotations.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Annotations.fromMap(Map<String, dynamic> json) => Annotations(
        sourceName: json["source_name"],
        sourceDescription: json["source_description"],
        datasetName: json["dataset_name"],
        datasetLink: json["dataset_link"],
        tableId: json["table_id"],
        topic: json["topic"],
        subtopic: json["subtopic"],
      );

  Map<String, dynamic> toMap() => {
        "source_name": sourceName,
        "source_description": sourceDescription,
        "dataset_name": datasetName,
        "dataset_link": datasetLink,
        "table_id": tableId,
        "topic": topic,
        "subtopic": subtopic,
      };
}
