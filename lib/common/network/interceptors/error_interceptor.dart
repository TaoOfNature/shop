import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shop/common/network/exception/network_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final exception = _mapDioError(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        response: err.response,
        type: err.type,
      ),
    );
  }

  NetworkException _mapDioError(DioException err) {
    // 无网络
    if (err.error is SocketException) {
      return NetworkException(message: 'No Internet connection');
    }

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(message: 'Connection timeout');

      case DioExceptionType.badResponse:
        return NetworkException(
          message: 'Server error',
          statusCode: err.response?.statusCode,
        );

      case DioExceptionType.cancel:
        return NetworkException(message: 'Request cancelled');

      default:
        return NetworkException(message: 'Unknown network error');
    }
  }
}
