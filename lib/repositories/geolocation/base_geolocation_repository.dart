import 'package:geolocator/geolocator.dart';

abstract class BaseGeoLoocationRepository {
  Future<Position?> getCurrentLocation();
}
