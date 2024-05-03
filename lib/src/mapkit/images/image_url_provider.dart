import 'dart:ffi' as ffi;
import 'package:yandex_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:yandex_maps_navikit/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_navikit/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_navikit/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_navikit/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_navikit/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_navikit/src/mapkit/images/image_data_descriptor.dart'
    as mapkit_images_image_data_descriptor;

part 'image_url_provider.impl.dart';

abstract class ImagesImageUrlProvider {
  /// Generates an URL that is used to load described image.
  ///
  /// This method may be called on any thread. Its implementation must be thread-safe.
  core.String formatUrl(
      mapkit_images_image_data_descriptor.ImagesImageDataDescriptor descriptor);
}
