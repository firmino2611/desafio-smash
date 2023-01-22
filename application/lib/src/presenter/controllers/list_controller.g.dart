// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListController on _ListControllerBase, Store {
  late final _$countriesAtom =
      Atom(name: '_ListControllerBase.countries', context: context);

  @override
  ObservableList<CountryModel> get countries {
    _$countriesAtom.reportRead();
    return super.countries;
  }

  @override
  set countries(ObservableList<CountryModel> value) {
    _$countriesAtom.reportWrite(value, super.countries, () {
      super.countries = value;
    });
  }

  late final _$citiesAtom =
      Atom(name: '_ListControllerBase.cities', context: context);

  @override
  ObservableList<CityModel> get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(ObservableList<CityModel> value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
    });
  }

  late final _$countryAtom =
      Atom(name: '_ListControllerBase.country', context: context);

  @override
  DocumentReference<Object?>? get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(DocumentReference<Object?>? value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  late final _$listCountriesAsyncAction =
      AsyncAction('_ListControllerBase.listCountries', context: context);

  @override
  Future<void> listCountries() {
    return _$listCountriesAsyncAction.run(() => super.listCountries());
  }

  late final _$fecthCitiesAsyncAction =
      AsyncAction('_ListControllerBase.fecthCities', context: context);

  @override
  Future<void> fecthCities() {
    return _$fecthCitiesAsyncAction.run(() => super.fecthCities());
  }

  late final _$_ListControllerBaseActionController =
      ActionController(name: '_ListControllerBase', context: context);

  @override
  dynamic setCountry(DocumentReference<Object?> c) {
    final _$actionInfo = _$_ListControllerBaseActionController.startAction(
        name: '_ListControllerBase.setCountry');
    try {
      return super.setCountry(c);
    } finally {
      _$_ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
countries: ${countries},
cities: ${cities},
country: ${country}
    ''';
  }
}
