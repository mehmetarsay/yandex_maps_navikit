import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:yandex_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_navikit/src/bindings/common/vector.dart' as vector;

part 'annotator.containers.dart';

/// Supported languages of the transport annotations.
@bindings_annotations.ContainerData(
    toNative: 'TransportAnnotationLanguage.toPointer',
    toPlatform:
        '(val) => TransportAnnotationLanguage.fromPointer(val, needFree: false)')
enum TransportAnnotationLanguage {
  /// Russian language.
  Russian,

  /// English language.
  English,
  ;

  /// @nodoc
  @internal
  static TransportAnnotationLanguage fromInt(core.int val) {
    return TransportAnnotationLanguage.values[val];
  }

  /// @nodoc
  @internal
  static core.int toInt(TransportAnnotationLanguage e) {
    return e.index;
  }

  /// @nodoc
  @internal
  static TransportAnnotationLanguage? fromPointer(ffi.Pointer<ffi.Void> ptr,
      {core.bool needFree = true}) {
    if (ptr.address == 0) {
      return null;
    }
    final result = fromInt(ptr.cast<ffi.Int64>().value);

    if (needFree) {
      malloc.free(ptr);
    }
    return result;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> toPointer(TransportAnnotationLanguage? val) {
    if (val == null) {
      return ffi.nullptr;
    }

    final result = malloc.call<ffi.Int64>();
    result.value = toInt(val);

    return result.cast<ffi.Void>();
  }
}