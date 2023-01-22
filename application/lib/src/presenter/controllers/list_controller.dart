import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:smash/src/models/city_model.dart';
import 'package:smash/src/models/country_model.dart';
import 'package:smash/src/use_cases/fecth_cities_use_cases.dart';
import 'package:smash/src/use_cases/list_countries_use_case.dart';

part 'list_controller.g.dart';

// ignore: library_private_types_in_public_api
class ListController = _ListControllerBase with _$ListController;

abstract class _ListControllerBase with Store {
  _ListControllerBase({
    required this.fecthCitiesUseCase,
    required this.listCountriesUseCase,
  });

  final ListCountriesUseCase listCountriesUseCase;
  final FecthCitiesUseCase fecthCitiesUseCase;

  @observable
  ObservableList<CountryModel> countries = ObservableList<CountryModel>();

  @observable
  ObservableList<CityModel> cities = ObservableList<CityModel>();

  @observable
  DocumentReference? country;

  @action
  Future<void> listCountries() async {
    final result = await listCountriesUseCase();

    for (var country in result) {
      countries.add(country);
    }
  }

  @action
  Future<void> fecthCities() async {
    final result = await fecthCitiesUseCase(country!);

    for (var city in result) {
      cities.add(city);
    }
  }

  @action
  setCountry(DocumentReference c) {
    country = c;
  }
}
