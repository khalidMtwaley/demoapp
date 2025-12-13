import 'package:demoapp/core/routes/routes_name.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../cache/hive/hive_methods.dart';
import '../locale/app_locale_key.dart';
import '../routes/app_routers_import.dart';
import '../utils/common_methods.dart';
import 'status_code.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors();
  static bool isInternet = true;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    isInternet = true;
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['Accept-Language'] = HiveMethods.getLang();

    if (HiveMethods.getToken() != null) {
      options.headers['Authorization'] = "Bearer ${HiveMethods.getToken()}";
    }

    // Check internet connectivity before sending request
    if (!await CommonMethods.hasConnection()) {
      isInternet = false;
      return handler.reject(
        DioException(
          requestOptions: options,
          error: 'No Internet Connection',
          type: DioExceptionType.connectionError,
        ),
      );
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

    if (response.statusCode == StatusCode.unauthorized) {
      HiveMethods.deleteToken();
      // Navigator.of(AppRouters.navigatorKey.currentContext!)
      //     .pushNamed(RoutesName.loginScreen);
      return;
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == StatusCode.unauthorized) {
      // Navigator.of(AppRouters.navigatorKey.currentContext!)
      //     .pushNamed(RoutesName.loginScreen);
      return;
    }
    // debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    // // Handle no internet connection error
    // if (err.type == DioExceptionType.unknown && err.error == 'No Internet Connection') {
    //   showDialog(
    //     context: AppRouters.navigatorKey.currentContext!,
    //     builder: (_) => AlertDialog(
    //       title: Text(AppLocaleKey.noInternet.tr()),
    //       content: Text(AppLocaleKey.pleaaddNotesCheckYourConnectionAndTryAgain.tr()),
    //     ),
    //   );
    // }

    super.onError(err, handler);
  }
}
