import 'dart:ffi' as ffi;
import 'package:yandex_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:meta/meta.dart';
import 'package:yandex_maps_navikit/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_navikit/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_navikit/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_navikit/src/runtime/local_error.dart'
    as runtime_local_error;

/// @nodoc
class _StorageErrorListenerWrapper implements ffi.Finalizable {
  _StorageErrorListenerWrapper(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  static final _finalizer =
      ffi.NativeFinalizer(_StorageErrorListener_free.cast());
  final ffi.Pointer<ffi.Void> ptr;
}

/// Storage error listener. This is a listener to subscribe to storage
/// errors in managers that control some type of storage.
abstract class StorageErrorListener {
  static final _pointerToListener =
      <ffi.Pointer<ffi.Void>, core.WeakReference<StorageErrorListener>>{};
  static final _listenerToPointer =
      weak_map.WeakMap<StorageErrorListener, _StorageErrorListenerWrapper?>();

  /// Possible error types: - [runtime_local_error.DiskCorruptError]:
  /// Called if local storage is corrupted. -
  /// [runtime_local_error.DiskFullError]: Called if local storage is full.
  /// - [runtime_local_error.DiskWriteAccessError]: Called if the
  /// application cannot get write access to local storage.
  void onStorageError(runtime_local_error.LocalError error);

  static void _destructor(core.dynamic data) {
    final core.int address = data;
    final ptr = ffi.Pointer<ffi.Void>.fromAddress(address);
    _pointerToListener.remove(ptr);
  }

  static ffi.Pointer<ffi.Void> _newNativeObject(StorageErrorListener obj) {
    final ptr = _StorageErrorListener_new(ffi.Pointer.fromFunction<
        ffi.Void Function(ffi.Pointer<ffi.Void>,
            ffi.Pointer<ffi.Void>)>(_StorageErrorListener_onStorageError));
    _pointerToListener[ptr] = core.WeakReference(obj);
    _listenerToPointer[obj] = _StorageErrorListenerWrapper(ptr);
    _StorageErrorListenersetSendPort(
        ptr,
        nativeBinding.createPortWithCallback(_destructor),
        nativeBinding.createExecutePort());

    return ptr;
  }

  /// @nodoc
  @internal
  static ffi.Pointer<ffi.Void> getNativePtr(StorageErrorListener? obj) {
    if (obj == null) return ffi.nullptr;

    final foundPointer = _listenerToPointer[obj];
    if (foundPointer == null) {
      return _newNativeObject(obj);
    }

    return foundPointer.ptr;
  }
}

final void Function(ffi.Pointer<ffi.Void>, core.int, core.int)
    _StorageErrorListenersetSendPort = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Int64, ffi.Int64)>>(
            'yandex_flutter_mapkit_storage_StorageErrorListener_setSendPort')
        .asFunction(isLeaf: true);

final ffi.Pointer<ffi.Void> Function(
        ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)
    _StorageErrorListener_new = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<ffi.Void> Function(
                        ffi.Pointer<
                            ffi
                            .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>)>>(
            'yandex_flutter_mapkit_storage_StorageErrorListener_new')
        .asFunction(isLeaf: true);

final _StorageErrorListener_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'yandex_flutter_mapkit_storage_StorageErrorListener_free');
void _StorageErrorListener_onStorageError(
    ffi.Pointer<ffi.Void> _ptr, ffi.Pointer<ffi.Void> error) {
  final listener = StorageErrorListener._pointerToListener[_ptr]?.target;
  if (listener == null) {
    throw core.Exception();
  }
  try {
    listener
        .onStorageError(runtime_local_error.LocalError.fromNativePtr(error));
  } catch (e, stack) {
    exception.nativeAssert(
        'Unhandled exception $e from native call listener\n$stack');
    rethrow;
  }
}
