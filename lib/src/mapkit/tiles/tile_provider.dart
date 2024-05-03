import 'dart:ffi' as ffi;
import 'package:yandex_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:yandex_maps_navikit/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:yandex_maps_navikit/src/bindings/common/exception.dart'
    as exception;
import 'package:yandex_maps_navikit/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_navikit/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_navikit/src/bindings/weak_map/weak_map.dart'
    as weak_map;
import 'package:yandex_maps_navikit/src/mapkit/raw_tile.dart'
    as mapkit_raw_tile;
import 'package:yandex_maps_navikit/src/mapkit/tile_id.dart' as mapkit_tile_id;
import 'package:yandex_maps_navikit/src/mapkit/version.dart' as mapkit_version;

part 'tile_provider.impl.dart';

/// Generates tiles.
abstract class TileProvider {
  /// Generates tile.
  ///
  /// This method will be called on a background thread.
  core.Future<mapkit_raw_tile.RawTile> load(
      mapkit_tile_id.TileId tileId,
      mapkit_version.Version version,
      core.Map<core.String, core.String> features,
      core.String etag);
}
