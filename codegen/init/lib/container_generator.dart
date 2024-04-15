import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:yandex_maps_navikit/src/bindings/annotations/annotations.dart';

class ContainerGenerator extends GeneratorForAnnotation<ContainerData> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final toNative = annotation.read('toNative').stringValue;
    final toPlatform = annotation.read('toPlatform').stringValue;
    final platformType = element.name;

    const nativeType = 'ffi.Pointer<ffi.Void>';
    const nullValue = 'ffi.nullptr';
    const stringMap = 'string_map.StringMap';
    const vector = 'vector.Vector';
    const map = 'core.Map';
    const list = 'core.List';
    const string = 'core.String';

    return '''extension ${element.name}ContainerExtension on ${element.name} {
  static $nativeType toNativeMap($map<$string, $platformType?>? obj) {
    if (obj == null) {
      return $nullValue;
    }

    return string_map.toNativeMap(obj, $toNative);
  }

  static $nativeType toNativeMapVector($map<$string, $list<$platformType?>?>? obj) {
    if (obj == null) {
      return $nullValue;
    }

    return string_map.toNativeMap(obj, toNativeVector);
  }

  static $nativeType toNativeMapDictionary($map<$string, $map<$string, $platformType?>?>? obj) {
    if (obj == null) {
      return $nullValue;
    }

    return string_map.toNativeMap(obj, toNativeMap);
  }

  static $nativeType toNativeVector($list<$platformType?>? obj) {
    if (obj == null) {
      return $nullValue;
    }

    return vector.toNativeVector(obj, $toNative);
  }

  static $nativeType toNativeVectorVector($list<$list<$platformType?>?>? obj) {
    if (obj == null) {
      return $nullValue;
    }

    return vector.toNativeVector(obj, toNativeVector);
  }

  static $nativeType toNativeVectorDictionary($list<$map<$string, $platformType?>?>? obj) {
    if (obj == null) {
      return $nullValue;
    }

    return vector.toNativeVector(obj, toNativeMap);
  }

  static $stringMap<$platformType> toPlatformMap($nativeType ptr) {
    return $stringMap(ptr, $toPlatform);
  }

  static $stringMap<$vector<$platformType>> toPlatformMapVector($nativeType ptr) {
    return $stringMap(ptr, (val) => val == $nullValue ? null : toPlatformVector(val.cast<$nativeType>().value));
  }

  static $stringMap<$stringMap<$platformType>> toPlatformMapDictionary($nativeType ptr) {
    return $stringMap(ptr, (val) => val == $nullValue ? null : toPlatformMap(val.cast<$nativeType>().value));
  }

  static $vector<$platformType> toPlatformVector($nativeType ptr) {
    return $vector(ptr, $toPlatform);
  }

  static $vector<$vector<$platformType>> toPlatformVectorVector($nativeType ptr) {
    return $vector(ptr, (val) => val == $nullValue ? null : toPlatformVector(val.cast<$nativeType>().value));
  }

  static $vector<$stringMap<$platformType>> toPlatformVectorDictionary($nativeType ptr) {
    return $vector(ptr, (val) => val == $nullValue ? null : toPlatformMap(val.cast<$nativeType>().value));
  }
}''';
  }
}

Builder generate(BuilderOptions options) =>
    PartBuilder([ContainerGenerator()], '.containers.dart');