import 'package:fluttertoast/fluttertoast.dart';

class HelperFunction {
  void showToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
    );
  }
}
