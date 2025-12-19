import 'package:shop/data/datasources/local/local_storage.dart';

class TokenManager {
  static const String _tokenKey = 'user_token';

  final LocalStorage _storage;

  // 这里的核心：通过构造函数注入 LocalStorage
  TokenManager(this._storage);

  /// 保存 Token 和用户信息
  Future<bool> saveToken(String token) async {
    return await _storage.setString(_tokenKey, token);
  }

  /// 获取 Token
  Future<String?> getToken() async {
    return _storage.getString(_tokenKey);
  }

  /// 清除 Token 和用户信息
  Future<void> clearToken() async {
    await _storage.remove(_tokenKey);
  }

  /// 检查是否已登录
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
