part of 'geolocation_bloc.dart';

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();

  @override
  List<Object> get props => [];
}

class LoadGeoLocationEvent extends GeolocationEvent {}

class UpdateGeoLocationEvent extends GeolocationEvent {
  final Position position;
  const UpdateGeoLocationEvent({
    required this.position,
  });
  @override
  List<Object> get props => [position];
}
