import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smash/src/models/city_model.dart';
import 'package:smash/src/models/country_model.dart';
import 'package:smash/src/repositories/impl/list_repository_impl.dart';
import 'package:smash/src/repositories/list_repository.dart';

void main() {
  final firestore = FakeFirebaseFirestore();
  late ListRepository repository;

  setUp(() {
    repository = ListRepositoryImpl(firestore);
  });
  test('should return List<CountryModel>', () async {
    var result = await repository.listCountries();

    expect(result, isA<List<CountryModel>>());
  });

  test('should return List<CityModel>', () async {
    var result = await repository.fecthCities(
      firestore.doc('cities/Brazil'),
    );

    expect(result, isA<List<CityModel>>());
  });
}
