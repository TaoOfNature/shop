import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _tokenKey = 'user_token';

  static final TokenManager _instance = TokenManager._internal();
  factory TokenManager() => _instance;
  TokenManager._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// 保存 Token 和用户信息
  Future<bool> saveToken(String token) async {
    await init();
    return await _prefs!.setString(_tokenKey, token);
  }

  /// 获取 Token
  Future<String?> getToken() async {
    await init();
    return _prefs!.getString(_tokenKey);
  }

  /// 清除 Token 和用户信息
  Future<void> clearToken() async {
    await init();
    await _prefs!.remove(_tokenKey);
  }

  /// 检查是否已登录
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
