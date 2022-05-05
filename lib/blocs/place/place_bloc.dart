import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mapbox_search/mapbox_search.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  PlaceBloc() : super(PlaceInitialState()) {
    on<PlaceEvent>((event, emit) async {
      if (event is SelectedPlaceEvent) {
        emit(PlaceLoadingState());
        // emit(PlaceLoadedState(place: event.place));

        await Future.delayed(const Duration(seconds: 3), () {
          emit(PlaceLoadedState(place: event.place));
        });
      }
    });
  }
}
