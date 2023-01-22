import 'package:cloud_firestore/cloud_firestore.dart';

class CityModel {
  CityModel({
    required this.subCountry,
    required this.name,
    required this.country,
  });

  final String subCountry;
  final String name;
  final DocumentReference country;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'name': name,
      'subCountry': subCountry,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      country: map['country'] as DocumentReference,
      name: map['name'] as String,
      subCountry: map['subCountry'] as String,
    );
  }
}
