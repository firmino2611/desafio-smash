import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smash/src/models/city_model.dart';
import 'package:smash/src/models/country_model.dart';
import 'package:smash/src/repositories/list_repository.dart';

class ListRepositoryImpl implements ListRepository {
  ListRepositoryImpl(this.firestore);

  final FirebaseFirestore firestore;

  @override
  Future<List<CityModel>> fecthCities(
    DocumentReference country,
  ) async {
    final cities = await firestore
        .collection("cities")
        .where("country", isEqualTo: country)
        .get();

    return cities.docs.map((city) {
      return CityModel.fromMap(
        city.data(),
      );
    }).toList();
  }

  @override
  Future<List<CountryModel>> listCountries() async {
    final countries = await firestore.collection("countries").get();

    return countries.docs.map((country) {
      return CountryModel.fromMap({
        ...country.data(),
        "ref": country.reference,
      });
    }).toList();
  }
}
