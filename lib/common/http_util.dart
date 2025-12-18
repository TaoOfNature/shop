import 'package:dio/dio.dart';
import 'package:shop/common/token_manager.dart';
import 'package:shop/data/datasources/api_service.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio _dio;
  late ApiService _apiService;
  final TokenManager _tokenManager = TokenManager();

  HttpUtil._internal() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      ),
    );

    // 添加请求拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 自动添加 token
          final token = await _tokenManager.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },onError: (error, handler) {
          
        },
      ),
    );

    _apiService = ApiService(_dio);
  }

  ApiService get apiService => _apiService;
}
