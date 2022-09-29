import 'package:al_jaami/screens/home.dart';
import 'package:al_jaami/services/providers.dart';
import 'package:al_jaami/services/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => serviceLocator<CountryProvider>())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
