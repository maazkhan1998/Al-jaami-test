import 'package:flutter/cupertino.dart';

import 'model.dart';

class CountryProvider with ChangeNotifier {
  List<Country> _countries = [];

  void setCountries(List<Country> countries) {
    _countries = List.from(countries);
    notifyListeners();
  }

  void clearCountries() {
    _countries.clear();
    notifyListeners();
  }

  List<Country> get countries => List<Country>.from(_countries);
}
