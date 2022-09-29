import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 5,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade900),
      backgroundColor: Colors.white,
    );
  }
}
