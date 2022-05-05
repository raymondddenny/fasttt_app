part of 'place_bloc.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();

  @override
  List<Object> get props => [];
}

class PlaceInitialState extends PlaceState {}

class PlaceLoadingState extends PlaceState {}

class PlaceLoadedState extends PlaceState {
  final MapBoxPlace place;
  // final double lat;
  // final double long;

  const PlaceLoadedState({
    required this.place,
    // required this.lat,
    // required this.long,
  });
  @override
  List<Object> get props => [place];
  // List<Object> get props => [lat, long];
}

class PlaceErrorState extends PlaceState {}
