import 'package:fasttt/models/models.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:mapbox_search/mapbox_search.dart';

@immutable
abstract class BasePlacesRepository {
  // Future<List<PlaceAutoComplete>?> getPlaceAutoComplete(String searchInput);
  Future<List<MapBoxPlace>?> getPlacesAutoCompleted(String searchInput);
  Future<List<MapBoxPlace>?> getPlacesLocation({required String id});
}
