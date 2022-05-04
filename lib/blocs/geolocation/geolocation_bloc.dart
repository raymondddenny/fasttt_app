import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fasttt/repositories/geolocation/geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository geolocationRepository;
  GeolocationBloc({
    required this.geolocationRepository,
  }) : super(GeolocationLoadingState()) {
    on<GeolocationEvent>((event, emit) async {
      if (event is LoadGeoLocationEvent) {
        emit(GeolocationLoadingState());
        final Position? position = await geolocationRepository.getCurrentLocation();

        if (position != null) {
          add(UpdateGeoLocationEvent(position: position));
        } else {
          emit(GeolocationErrorState());
        }
      } else if (event is UpdateGeoLocationEvent) {
        emit(GeolocationLoadedState(position: event.position));
      }
    });
  }
}
