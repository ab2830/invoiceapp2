import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class APIServices {
  static dynamic postWithDio(String url, var body, {var token}) async {
    EasyLoading.show();


    var tokens = "Bearer "+token ?? '';

    var dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "accept": "*/*",
            "IsMobileApp": true,
            "Authorization": "$tokens",
            "Content-type": "application/json",
          },
        ),
      );
      EasyLoading.dismiss();

      debugPrint("postWithDio :$url");
      debugPrint("postWithDio :${response.statusCode}");
      debugPrint("postWithDio :${response.data}");

      final responseJson = response;
      return responseJson;
    } catch (exception) {
      if (exception.toString().contains('SocketException')) {
        //   commonApiExceptionDialog();
        return 'NetworkError';
      } else {
        print("elsseee---${exception.toString()}");
        return null;
      }
    }
  }



  static dynamic putWithDio(String url, var body, {var token}) async {
    EasyLoading.show();
print("put body::--${body}");

    var tokens = "Bearer "+token ?? '';

    var dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    try {
      final response = await dio.put(
        url,
        data: body,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "accept": "*/*",

            "Authorization": "$tokens",
            "Content-type": "application/json",
          },
        ),
      );
      EasyLoading.dismiss();

      debugPrint("postWithDio :$url");
      debugPrint("postWithDio :${response.statusCode}");
      debugPrint("postWithDio :${response.data}");

      final responseJson = response;
      return responseJson;
    } catch (exception) {
      if (exception.toString().contains('SocketException')) {
        //   commonApiExceptionDialog();
        return 'NetworkError';
      } else {
        print("elsseee---${exception.toString()}");
        return null;
      }
    }
  }

  static dynamic postLogin(String url, var body, {var token}) async {
    EasyLoading.show();


    var tokens = token ?? '';

    var dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "accept": "*/*",
            "IsMobileApp": true,
            "Authorization": "$tokens",
            "Content-type": "application/json",
          },
        ),
      );
      EasyLoading.dismiss();

      debugPrint("postWithDio :$url");
      debugPrint("postWithDio :${response.statusCode}");
      debugPrint("postWithDio :${response.data}");

      final responseJson = response;
      return responseJson;
    } catch (exception) {
      if (exception.toString().contains('SocketException')) {
        //   commonApiExceptionDialog();
        return 'NetworkError';
      } else {
        print("elsseee---${exception.toString()}");
        return null;
      }
    }
  }

  static dynamic postWithoutBody(String url, var token) async {
    EasyLoading.show();

    var tokens = token ?? '';
    var dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    try {
      final response = await dio.post(
        url,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "accept": "*/*",
            "IsMobileApp": true,
            "Authorization": "$tokens",
            "Content-type": "application/json",
          },
        ),
      );
      EasyLoading.dismiss();

      debugPrint("postWithDio :$url");
      debugPrint("postWithDio :${response.statusCode}");
      debugPrint("postWithDio :${response.data}");

      final responseJson = response;
      return responseJson;
    } catch (exception) {
      if (exception.toString().contains('SocketException')) {
        //   commonApiExceptionDialog();
        return 'NetworkError';
      } else {
        print("elsseee---${exception.toString()}");
        return null;
      }
    }
  }

  static dynamic getMethodWithHeaderDio(String url, {String? token}) async {
     EasyLoading.show();
    var dio = Dio();
    // ignore: deprecated_member_use
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    try {
      final response = await dio.get(
        url,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "accept": "*/*",

            "Authorization": "Bearer $token"
          },
        ),
      );

  EasyLoading.dismiss();
      // debugPrint("getMethodWithHeaderDio :$url");
      // debugPrint("getMethodWithHeaderDio :${response.statusCode}");
      // debugPrint("getMethodWithHeaderDio :${response.data}");
      // if (response.statusCode == 403 && response.statusCode == 404 ||
      //     response.statusCode == 503) {
      // } else if (response.statusCode == 200) {
      //   final responseJson = response.data;
      print("api response::-${response}");
      final responseJson = response;
      return responseJson;

    } catch (exception) {
      if (exception.toString().contains('SocketException')) {
     //   commonApiExceptionDialog();
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }
}
