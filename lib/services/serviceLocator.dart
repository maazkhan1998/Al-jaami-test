import 'package:al_jaami/services/providers.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<CountryProvider>(() => CountryProvider());
}