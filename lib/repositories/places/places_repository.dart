import 'package:fasttt/repositories/places/base_places_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_search/mapbox_search.dart';

class PlacesRepository implements BasePlacesRepository {
  final String key = dotenv.get('MAPBOX_ACCESS_TOKEN');

  @override
  Future<List<MapBoxPlace>?> getPlacesAutoCompleted(String searchInput) async {
    var placesSearch = PlacesSearch(
      apiKey: key,
      limit: 5,
    );

    final result = await placesSearch.getPlaces(searchInput);

    print('result getPlaces $result');
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }

  @override
  Future<List<MapBoxPlace>?> getPlacesLocation({required String id}) async {
    var reverseGeoCoding = ReverseGeoCoding(
      apiKey: key,
      limit: 5,
    );
  }
}
