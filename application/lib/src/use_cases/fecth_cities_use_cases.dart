import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smash/src/models/city_model.dart';
import 'package:smash/src/repositories/list_repository.dart';

class FecthCitiesUseCase {
  final ListRepository repository;

  FecthCitiesUseCase(this.repository);

  Future<List<CityModel>> call(DocumentReference country) {
    return repository.fecthCities(country);
  }
}
