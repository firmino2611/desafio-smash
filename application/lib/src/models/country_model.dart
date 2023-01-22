// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class CountryModel {
  CountryModel({
    required this.name,
    this.ref,
  });

  final String name;
  final DocumentReference? ref;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'ref': ref,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      name: map['name'] as String,
      ref: map['ref'],
    );
  }
}
