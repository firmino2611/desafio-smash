import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:smash/src/presenter/constants/numbers_constant.dart';
import 'package:smash/src/presenter/constants/strings_constant.dart';
import 'package:smash/src/presenter/controllers/list_controller.dart';

class ListCitiesPage extends StatefulWidget {
  const ListCitiesPage({
    super.key,
  });

  @override
  State<ListCitiesPage> createState() => _ListCitiesPageState();
}

class _ListCitiesPageState extends State<ListCitiesPage> {
  final controller = GetIt.I<ListController>();

  @override
  void initState() {
    super.initState();

    controller.fecthCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: NumbersContants.zero.toDouble(),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(StringsConstant.titleCities),
      ),
      body: Observer(
        builder: (context) {
          if (controller.cities.isEmpty) {
            return const CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: controller.cities.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: NumbersContants.verticalPaddging,
                  horizontal: NumbersContants.horizontalPaddging,
                ),
                title: Text(
                  controller.cities[index].name,
                  style: const TextStyle(
                    fontSize: NumbersContants.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  controller.cities[index].subCountry,
                  style: const TextStyle(
                    fontSize: NumbersContants.fontSize,
                  ),
                ),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
