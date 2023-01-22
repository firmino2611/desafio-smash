import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:smash/src/presenter/constants/numbers_constant.dart';
import 'package:smash/src/presenter/constants/strings_constant.dart';
import 'package:smash/src/presenter/controllers/list_controller.dart';

class ListCountriesPage extends StatefulWidget {
  const ListCountriesPage({super.key});

  @override
  State<ListCountriesPage> createState() => _ListCountriesPageState();
}

class _ListCountriesPageState extends State<ListCountriesPage> {
  final controller = GetIt.I<ListController>();

  @override
  void initState() {
    super.initState();

    controller.listCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: NumbersContants.zero.toDouble(),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(StringsConstant.titleCountries),
      ),
      body: Observer(
        builder: (context) {
          if (controller.countries.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: controller.countries.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: NumbersContants.verticalPaddging,
                  horizontal: NumbersContants.horizontalPaddging,
                ),
                title: Text(
                  controller.countries[index].name,
                  style: const TextStyle(
                    fontSize: NumbersContants.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  controller.setCountry(controller.countries[index].ref!);
                  Navigator.pushNamed(context, '/cities');
                },
              );
            },
          );
        },
      ),
    );
  }
}
