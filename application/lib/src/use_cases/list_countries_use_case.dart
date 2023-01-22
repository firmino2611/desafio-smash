import 'package:smash/src/models/country_model.dart';
import 'package:smash/src/repositories/list_repository.dart';

class ListCountriesUseCase {
  final ListRepository repository;

  ListCountriesUseCase(this.repository);

  Future<List<CountryModel>> call() {
    return repository.listCountries();
  }
}
