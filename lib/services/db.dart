import 'package:al_jaami/networking/api_base_helper.dart';
import 'package:al_jaami/services/customExceptionHandling.dart';
import 'package:al_jaami/services/model.dart';

class DB {
  static final shared = DB();

  Future<List<Country>> getAllCountries() async {
    try {
      final response = await ApiBaseHelper.shared
          .get("https://vipankumar.com/SmartHealth/api/getCountries");

      if (response.status && response.data != null) {
        final responseData = response.data as Map<String, dynamic>;
        final countriesList = (responseData["countries"] ?? []) as List;
        return List<Country>.generate(countriesList.length,
            (index) => Country.fromJson(countriesList[index]));
      }

      return [];
    } catch (e) {
      throw CustomExceptionHandling().handleException(e);
    }
  }
}
