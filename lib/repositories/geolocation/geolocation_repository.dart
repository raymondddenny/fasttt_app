import 'package:fasttt/repositories/geolocation/base_geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepository implements BaseGeoLoocationRepository {
  GeolocationRepository();
  @override
  Future<Position?> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }
}
