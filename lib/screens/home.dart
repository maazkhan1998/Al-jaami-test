import 'dart:async';

import 'package:al_jaami/services/customExceptionHandling.dart';
import 'package:al_jaami/services/db.dart';
import 'package:al_jaami/services/helper_function.dart';
import 'package:al_jaami/services/serviceLocator.dart';
import 'package:al_jaami/shared/customindicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/providers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<bool> _loading = ValueNotifier<bool>(true);
  final countryProvider = serviceLocator<CountryProvider>();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    getCountries();
    _timer = Timer.periodic(const Duration(seconds: 10),
        (timer) => countryProvider.clearCountries());
  }

  Future<void> getCountries() async {
    try {
      final countries = await DB.shared.getAllCountries();

      countryProvider.setCountries(countries);
    } catch (e) {
      HelperFunction().showToast(CustomExceptionHandling().handleException(e));
    } finally {
      _loading.value = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
                onRefresh: getCountries,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    Consumer<CountryProvider>(
                        builder: (ctx, prov, _) => SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (ctx, i) => ListTile(
                                  leading: CircleAvatar(
                                    child: Image.network(
                                        prov.countries[i].image!,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Text("No image")),
                                  ),
                                  title: Text(prov.countries[i].countryName!),
                                  subtitle: Text(
                                      "Country Code: ${prov.countries[i].countryCode}"),
                                ),
                                childCount: prov.countries.length,
                              ),
                            )),
                  ],
                )),
          ),
        ),
        ValueListenableBuilder<bool>(
            valueListenable: _loading,
            builder: (ctx, val, _) => _loading.value
                ? const Center(child: CustomCircularIndicator())
                : Container())
      ],
    );
  }
}
