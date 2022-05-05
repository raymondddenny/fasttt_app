part of 'auto_complete_place_bloc.dart';

abstract class AutoCompletePlaceEvent extends Equatable {
  const AutoCompletePlaceEvent();

  @override
  List<Object> get props => [];
}

class LoadAutoCompletePlaceEvent extends AutoCompletePlaceEvent {
  final String searchInput;

  const LoadAutoCompletePlaceEvent({this.searchInput = ''});

  @override
  List<Object> get props => [searchInput];
}

class SelectedAutoCompletePlaceEvent extends AutoCompletePlaceEvent {
  final MapBoxPlace place;
  const SelectedAutoCompletePlaceEvent({
    required this.place,
  });
  @override
  List<Object> get props => [place];
}
