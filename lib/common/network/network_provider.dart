import 'package:dio/dio.dart';
import 'package:shop/common/network/interceptors/auth_interceptor.dart';
import 'package:shop/common/network/dio_client.dart';
import 'package:shop/common/network/interceptors/error_interceptor.dart';
import 'package:shop/data/datasources/local/token_manager.dart';

class NetworkProvider {
  static final NetworkProvider _instance = NetworkProvider._();
  factory NetworkProvider() => _instance;

  late final DioClient dioClient;

  NetworkProvider._() {
    dioClient = DioClient(
      interceptors: [
        AuthInterceptor(TokenManager()),
        ErrorInterceptor(),
        LogInterceptor(responseBody: true),
      ],
    );
  }
}
