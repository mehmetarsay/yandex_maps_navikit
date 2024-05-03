import 'dart:ffi' as ffi;
import 'package:yandex_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_navikit/src/bindings/common/native_types.dart'
    as native_types;
import 'package:yandex_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_navikit/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_navikit/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_navikit/src/bindings/common/vector.dart' as vector;
import 'package:yandex_maps_navikit/src/mapkit/geometry/point.dart'
    as mapkit_geometry_point;

part 'location.containers.dart';
part 'location.impl.dart';

final class Location {
  final mapkit_geometry_point.Point position;
  final core.double? accuracy;
  final core.double? altitude;
  final core.double? altitudeAccuracy;
  final core.double? heading;
  final core.double? speed;
  final core.DateTime absoluteTimestamp;
  final core.DateTime relativeTimestamp;

  const Location(
    this.position,
    this.absoluteTimestamp,
    this.relativeTimestamp, {
    this.accuracy,
    this.altitude,
    this.altitudeAccuracy,
    this.heading,
    this.speed,
  });

  @core.override
  core.int get hashCode => core.Object.hashAll([
        position,
        accuracy,
        altitude,
        altitudeAccuracy,
        heading,
        speed,
        absoluteTimestamp,
        relativeTimestamp,
      ]);

  @core.override
  core.bool operator ==(covariant Location other) {
    if (core.identical(this, other)) {
      return true;
    }
    return position == other.position &&
        accuracy == other.accuracy &&
        altitude == other.altitude &&
        altitudeAccuracy == other.altitudeAccuracy &&
        heading == other.heading &&
        speed == other.speed &&
        absoluteTimestamp == other.absoluteTimestamp &&
        relativeTimestamp == other.relativeTimestamp;
  }

  @core.override
  core.String toString() {
    return "Location(position: $position, accuracy: $accuracy, altitude: $altitude, altitudeAccuracy: $altitudeAccuracy, heading: $heading, speed: $speed, absoluteTimestamp: $absoluteTimestamp, relativeTimestamp: $relativeTimestamp, )";
  }
}
