import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart';

class AppLogger {
  static bool _initialized = false;

  static void init({Level level = Level.ALL}) {
    if (_initialized) return;
    _initialized = true;

    Logger.root.level = level;
    Logger.root.onRecord.listen(_onRecord);
  }

  static void _onRecord(LogRecord record) {
    // Release 环境降噪
    if (kReleaseMode && record.level < Level.WARNING) {
      return;
    }
    final msg =
        '[${record.level.name}] '
        '[${record.time.toIso8601String()}] '
        '[${record.loggerName}] '
        '${record.message}';

    debugPrint(msg);

    if (record.error != null) {
      debugPrint('Error: ${record.error}');
    }
    if (record.stackTrace != null) {
      debugPrint(record.stackTrace.toString());
    }
  }

  /// 获取 logger（按模块 / 文件名）
  static Logger get(String name) => Logger(name);
}
