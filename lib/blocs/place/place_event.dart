part of 'place_bloc.dart';

abstract class PlaceEvent extends Equatable {
  const PlaceEvent();

  @override
  List<Object> get props => [];
}

class SelectedPlaceEvent extends PlaceEvent {
  final MapBoxPlace place;
  // final double lat;
  // final double long;
  const SelectedPlaceEvent({
    required this.place,
    // required this.lat,
    // required this.long,
  });

  @override
  List<Object> get props => [place];
}
