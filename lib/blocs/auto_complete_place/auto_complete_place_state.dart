part of 'auto_complete_place_bloc.dart';

abstract class AutoCompletePlaceState extends Equatable {
  const AutoCompletePlaceState();

  @override
  List<Object> get props => [];
}

class AutoCompletePlaceLoadingState extends AutoCompletePlaceState {}

class AutoCompletePlaceLoadedState extends AutoCompletePlaceState {
  final List<MapBoxPlace> autoComplete;

  const AutoCompletePlaceLoadedState({required this.autoComplete});

  @override
  List<Object> get props => [autoComplete];
}

class AutoCompletePlaceErrorState extends AutoCompletePlaceState {}
