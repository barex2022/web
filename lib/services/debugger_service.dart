import 'dart:math';

import 'package:logger/logger.dart';


class DebugLogger {
  static final DebugLogger _debugLogger = DebugLogger._();
  static late Logger _logger;

  static DebugLogger getInstance(){
    return _debugLogger;
  }

  DebugLogger._() {
    Logger.level = Level.debug;
    _logger = Logger();
  }

  void logD(message, [Object? error, StackTrace? stackTrace]) =>
      _logger.d(message, error = error, stackTrace = stackTrace);

  void logE(message, [Object? error, StackTrace? stackTrace]) =>
      _logger.e(message, error = error, stackTrace = stackTrace);

  void logI(message, [Object? error, StackTrace? stackTrace]) =>
      _logger.i(message, error = error, stackTrace = stackTrace);

}
