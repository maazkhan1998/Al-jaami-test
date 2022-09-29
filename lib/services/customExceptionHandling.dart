import 'dart:async';

import 'dart:io';

import 'package:flutter/services.dart';

class CustomExceptionHandling {
  ///handle all possible types of exceptions
  String handleException(dynamic e) {
    if (e is String) {
      return e;
    }

    if (e is TimeoutException) {
      return "Your request has timed out";
    }

    if (e is SocketException) {
      return "No internet connection";
    }

    if (e is PlatformException) {
      return "Error Occured";
    }

    if (e is TypeError) {
      return "Error Occured";
    }

    if (e is FormatException) {
      return "Service is currently unavailable";
    }

    return "Something went wrong";
  }
}
