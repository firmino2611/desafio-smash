import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smash/firebase_options.dart';
import 'package:smash/src/presenter/controllers/list_controller.dart';
import 'package:smash/src/presenter/pages/list_cities_page.dart';
import 'package:smash/src/presenter/pages/list_countries_page.dart';
import 'package:smash/src/repositories/impl/list_repository_impl.dart';
import 'package:smash/src/use_cases/fecth_cities_use_cases.dart';
import 'package:smash/src/use_cases/list_countries_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    // Substituir o host pelo ip de execução do emulador
    FirebaseFirestore.instance.useFirestoreEmulator("192.168.0.13", 8080);
  }

  GetIt.instance.registerSingleton<ListController>(
    ListController(
      fecthCitiesUseCase: FecthCitiesUseCase(
        ListRepositoryImpl(
          FirebaseFirestore.instance,
        ),
      ),
      listCountriesUseCase: ListCountriesUseCase(
        ListRepositoryImpl(
          FirebaseFirestore.instance,
        ),
      ),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Smash',
      theme: ThemeData(
        primaryColor: const Color(0xffa02468),
      ),
      routes: {
        '/': (context) => const ListCountriesPage(),
        '/cities': (context) => const ListCitiesPage(),
      },
    );
  }
}
