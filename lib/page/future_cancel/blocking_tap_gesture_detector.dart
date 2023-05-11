import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/blocking_option.dart';



/// BlockingOption 사용 예제
// onTap에 블로킹 추가한 GestureDetector
class BlockingTapGestureDetector extends GestureDetector with BlockingOption {
  BlockingTapGestureDetector({
    super.key,
    super.child,
    super.onTapDown,
    super.onTapUp,
    super.onTap,
    super.onTapCancel,
    super.onSecondaryTap,
    super.onSecondaryTapDown,
    super.onSecondaryTapUp,
    super.onSecondaryTapCancel,
    super.onTertiaryTapDown,
    super.onTertiaryTapUp,
    super.onTertiaryTapCancel,
    super.onDoubleTapDown,
    super.onDoubleTap,
    super.onDoubleTapCancel,
    super.onLongPressDown,
    super.onLongPressCancel,
    super.onLongPress,
    super.onLongPressStart,
    super.onLongPressMoveUpdate,
    super.onLongPressUp,
    super.onLongPressEnd,
    super.onSecondaryLongPressDown,
    super.onSecondaryLongPressCancel,
    super.onSecondaryLongPress,
    super.onSecondaryLongPressStart,
    super.onSecondaryLongPressMoveUpdate,
    super.onSecondaryLongPressUp,
    super.onSecondaryLongPressEnd,
    super.onTertiaryLongPressDown,
    super.onTertiaryLongPressCancel,
    super.onTertiaryLongPress,
    super.onTertiaryLongPressStart,
    super.onTertiaryLongPressMoveUpdate,
    super.onTertiaryLongPressUp,
    super.onTertiaryLongPressEnd,
    super.onVerticalDragDown,
    super.onVerticalDragStart,
    super.onVerticalDragUpdate,
    super.onVerticalDragEnd,
    super.onVerticalDragCancel,
    super.onHorizontalDragDown,
    super.onHorizontalDragStart,
    super.onHorizontalDragUpdate,
    super.onHorizontalDragEnd,
    super.onHorizontalDragCancel,
    super.onForcePressStart,
    super.onForcePressPeak,
    super.onForcePressUpdate,
    super.onForcePressEnd,
    super.onPanDown,
    super.onPanStart,
    super.onPanUpdate,
    super.onPanEnd,
    super.onPanCancel,
    super.onScaleStart,
    super.onScaleUpdate,
    super.onScaleEnd,
    super.behavior,
    super.excludeFromSemantics = false,
    super.dragStartBehavior = DragStartBehavior.start,
    this.ignoreBlocking = false,
    required this.description,
  });

  final String description;

  @override
  bool ignoreBlocking;

  @override
  GestureTapCallback? get onTap => () {
        bool isBlocked = blockOrRun(super.onTap);
        if (isBlocked) {
          log('<$runtimeType> :: $description is Blocked!!');
          Fluttertoast.cancel();
          Fluttertoast.showToast(msg: 'Tap is Blocked!!');
        }
      };
}
