import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smash/src/models/city_model.dart';
import 'package:smash/src/models/country_model.dart';

abstract class ListRepository {
  Future<List<CountryModel>> listCountries();
  Future<List<CityModel>> fecthCities(DocumentReference coutry);
}
