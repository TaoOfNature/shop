import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;

  DioClient({
    required List<Interceptor> interceptors,
  }) {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );

    dio.interceptors.addAll(interceptors);
  }
}
