import 'package:dio/dio.dart';
import 'package:shop/domain/entities/data_result.dart';
import '../models/base_response.dart';

mixin RepositoryHelper {
  Future<DataResult<E>> mapToResult<M, E>({
    required Future<BaseResponse<M>> Function() call,
    required E Function(M model) mapToEntity,
  }) async {
    try {
      // 1. 发起请求
      final response = await call();

      // 2. 这里的逻辑就在 Data 层把 BaseResponse 消化掉
      if (response.code == 200) {
        if (response.data != null) {
          // 成功：拆箱 -> 转换 -> 包装进 Success
          return Success(mapToEntity(response.data!));
        } else {
          return const Failure("服务器返回数据为空");
        }
      } else {
        // 业务失败 (例如 code 401 500 等)
        return Failure(response.message, code: response.code);
      }
    } on DioException catch (e) {
      // 3. 拦截器没抛异常，但 Dio 的网络错误(断网/超时)依然会进这里
      return Failure(_handleDioError(e));
    } catch (e) {
      // 4. 解析错误或其他代码错误
      return Failure("程序解析异常: $e");
    }
  }

  String _handleDioError(DioException error) {
    // 根据 DioExceptionType 返回用户看得懂的文字
    return switch (error.type) {
      DioExceptionType.connectionTimeout => "网络连接超时",
      DioExceptionType.sendTimeout => "请求超时",
      DioExceptionType.receiveTimeout => "响应超时",
      DioExceptionType.badResponse => "服务器响应异常(${error.response?.statusCode})",
      DioExceptionType.cancel => "请求已取消",
      _ => "网络连接异常，请检查网络",
    };
  }
}
