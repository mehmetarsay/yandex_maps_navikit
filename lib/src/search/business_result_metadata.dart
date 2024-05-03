import 'dart:ffi' as ffi;
import 'package:yandex_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:yandex_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:yandex_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:yandex_maps_navikit/src/bindings/common/to_native.dart'
    as to_native;
import 'package:yandex_maps_navikit/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:yandex_maps_navikit/src/bindings/common/vector.dart' as vector;
import 'package:yandex_maps_navikit/src/search/business_filter.dart'
    as search_business_filter;
import 'package:yandex_maps_navikit/src/search/category.dart'
    as search_category;
import 'package:yandex_maps_navikit/src/search/chain.dart' as search_chain;

part 'business_result_metadata.containers.dart';
part 'business_result_metadata.impl.dart';

abstract final class SearchBusinessResultMetadata implements ffi.Finalizable {
  factory SearchBusinessResultMetadata(
          core.List<search_category.SearchCategory> categories,
          core.List<search_chain.SearchChain> chains,
          core.List<search_business_filter.SearchBusinessFilter>
              businessFilters,
          search_business_filter.SearchFilterSet? importantFilters,
          core.List<core.String> pricesCurrencies) =>
      SearchBusinessResultMetadataImpl(categories, chains, businessFilters,
          importantFilters, pricesCurrencies);

  core.List<search_category.SearchCategory> get categories;
  core.List<search_chain.SearchChain> get chains;
  core.List<search_business_filter.SearchBusinessFilter> get businessFilters;
  search_business_filter.SearchFilterSet? get importantFilters;
  core.List<core.String> get pricesCurrencies;

  @core.override
  core.int get hashCode => core.Object.hashAll([
        categories,
        chains,
        businessFilters,
        importantFilters,
        pricesCurrencies
      ]);

  @core.override
  core.bool operator ==(covariant SearchBusinessResultMetadata other) {
    if (core.identical(this, other)) {
      return true;
    }
    return categories == other.categories &&
        chains == other.chains &&
        businessFilters == other.businessFilters &&
        importantFilters == other.importantFilters &&
        pricesCurrencies == other.pricesCurrencies;
  }

  @core.override
  core.String toString() {
    return "SearchBusinessResultMetadata(categories: $categories, chains: $chains, businessFilters: $businessFilters, importantFilters: $importantFilters, pricesCurrencies: $pricesCurrencies)";
  }
}
