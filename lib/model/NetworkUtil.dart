import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:shop/model/api_service.dart';

var _log = Logger("login");

class Networkutil {
  static final Networkutil _instance = Networkutil._internal();

  // 私有构造函数，防止外部直接创建
  Networkutil._internal() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5), // 连接超时
        receiveTimeout: const Duration(seconds: 3), // 接收超时
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer YOUR_TOKEN_HERE', // 全局认证 Token
        },
      ),
    );

    // 添加日志拦截器，方便调试
    dio.interceptors.add(LogInterceptor(responseBody: true));

    // 如果你需要处理错误，可以添加自定义拦截器
    // dio.interceptors.add(CustomErrorInterceptor());

    // final client = ApiService(dio);

    // client.getTasks().then((it) => _log.info(it));
  }

  // 工厂构造方法，保证只返回 _instance
  factory Networkutil() {
    return _instance;
  }
}
