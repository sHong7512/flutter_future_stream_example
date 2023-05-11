import 'dart:developer';

import 'package:async/async.dart';

// 멀티 동작 차단용 블로킹 추상 클래스
abstract class BlockingOption {
  abstract bool ignoreBlocking;

  static const Duration _blockingDuration = Duration(milliseconds: 100);
  static bool _blocking = false;
  static CancelableOperation? _cancelableOperation;

  static Future<bool> _unBlocking() async {
    await Future.delayed(_blockingDuration);
    return false;
  }

  static _setBlocking() async {
    _blocking = await _cancelableOperation?.cancel() ?? true;
    _cancelableOperation = CancelableOperation.fromFuture(_unBlocking(), onCancel: () => true);
    _blocking = await _cancelableOperation?.value ?? false;
  }

  bool blockOrRun<T>(Function? func, [T? params]) {
    if (!ignoreBlocking) {
      if (_blocking) {
        log('<$runtimeType> :: Blocking!');
        return true;
      }
    }
    _setBlocking();
    if (func is Function()) {
      func.call();
    } else {
      func?.call(params);
    }
    return false;
  }
}
