import 'dart:ffi' as ffi;
import 'package:yandex_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_navikit/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_navikit/src/bindings/common/exception.dart'
    as exception;

part 'callback.impl.dart';

abstract final class Callback {
  factory Callback({required void Function() onTaskFinished}) {
    return CallbackImpl(
      onTaskFinished: onTaskFinished,
    );
  }

  /// The callback is invoked when the task is completed successfully.
  void onTaskFinished();
}
