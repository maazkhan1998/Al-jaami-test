import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../services/customExceptionHandling.dart';
import '../services/model.dart';

class ApiBaseHelper {
  static ApiBaseHelper shared = ApiBaseHelper();

  final apiTimeOutDuration = const Duration(seconds: 30);

  ///get API call
  Future<ApiGenericResponse> get(String url) async {
    print('Api Get, url $url');
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(apiTimeOutDuration);
      final responseJson = _returnResponse(response);
      return responseJson;
    } catch (e) {
      throw CustomExceptionHandling().handleException(e);
    }
  }

  ///post API call
  Future<ApiGenericResponse> post(
      {required String url,
      required dynamic body,
      Map<String, String>? headers}) async {
    print('Api Post, url $url');
    try {
      final response = await http
          .post(Uri.parse(url), body: body, headers: headers)
          .timeout(apiTimeOutDuration);
      final responseJson = _returnResponse(response);
      return responseJson;
    } catch (e) {
      throw CustomExceptionHandling().handleException(e);
    }
  }

  ///put API call
  Future<ApiGenericResponse> put(String url, dynamic body) async {
    print('Api Put, url $url');
    try {
      final response = await http
          .put(Uri.parse(url), body: body)
          .timeout(apiTimeOutDuration);
      final responseJson = _returnResponse(response);
      return responseJson;
    } catch (e) {
      throw CustomExceptionHandling().handleException(e);
    }
  }

  ///delete API call
  Future<ApiGenericResponse> delete(String url) async {
    print('Api Delete, url $url');
    try {
      final response =
          await http.delete(Uri.parse(url)).timeout(apiTimeOutDuration);
      final apiResponse = _returnResponse(response);
      return apiResponse;
    } catch (e) {
      throw CustomExceptionHandling().handleException(e);
    }
  }

  ///return response of API
  ApiGenericResponse _returnResponse(http.Response response) {
    final body = json.decode(response.body) as Map<String, dynamic>;

    if (body["status"] == false) {
      throw CustomExceptionHandling()
          .handleException(body["message"] ?? "Something went wrong");
    }

    return ApiGenericResponse(
        status: body["status"],
        message: body["message"] ?? "",
        statusCode: response.statusCode,
        data: body["data"]);
  }
}
