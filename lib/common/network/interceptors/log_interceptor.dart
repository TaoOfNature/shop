import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LogInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      debugPrint('┌────── HTTP REQUEST ──────');
      debugPrint('│ ${options.method} ${options.uri}');
      debugPrint('│ Headers: ${options.headers}');
      if (options.data != null) {
        debugPrint('│ Body: ${options.data}');
      }
      debugPrint('└─────────────────────────');
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      debugPrint('┌────── HTTP RESPONSE ──────');
      debugPrint('│ ${response.requestOptions.method} '
          '${response.requestOptions.uri}');
      debugPrint('│ Status: ${response.statusCode}');
      debugPrint('│ Data: ${response.data}');
      debugPrint('└──────────────────────────');
    }
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      debugPrint('┌────── HTTP ERROR ──────');
      debugPrint('│ ${err.requestOptions.method} '
          '${err.requestOptions.uri}');
      debugPrint('│ Type: ${err.type}');
      debugPrint('│ Message: ${err.message}');
      if (err.response != null) {
        debugPrint('│ Status: ${err.response?.statusCode}');
        debugPrint('│ Data: ${err.response?.data}');
      }
      debugPrint('└────────────────────────');
    }
    handler.next(err);
  }
}
