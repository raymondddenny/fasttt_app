import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fasttt/models/models.dart';
import 'package:fasttt/repositories/places/places_repository.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:rxdart/rxdart.dart';
part 'auto_complete_place_event.dart';
part 'auto_complete_place_state.dart';

EventTransformer<Event> debounceSequential<Event>(Duration duration) {
  return (events, mapper) {
    return events.debounceTime(duration).switchMap(mapper);
  };
}

class AutoCompletePlaceBloc extends Bloc<AutoCompletePlaceEvent, AutoCompletePlaceState> {
  final PlacesRepository placesRepository;
  AutoCompletePlaceBloc({required this.placesRepository}) : super(AutoCompletePlaceLoadingState()) {
    on<AutoCompletePlaceEvent>(
      (event, emit) async {
        if (event is LoadAutoCompletePlaceEvent) {
          // emit(AutoCompletePlaceLoadingState());
          final List<MapBoxPlace>? autoComplete = await placesRepository.getPlacesAutoCompleted(event.searchInput);

          if (autoComplete != null) {
            emit(AutoCompletePlaceLoadedState(autoComplete: autoComplete));
          } else {
            emit(AutoCompletePlaceErrorState());
          }
        }
      },
      transformer: debounceSequential(const Duration(milliseconds: 500)),
    );
  }
}
