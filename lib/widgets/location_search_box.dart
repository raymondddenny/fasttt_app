import 'package:fasttt/blocs/auto_complete_place/auto_complete_place_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationSearchBoxWidget extends StatelessWidget {
  const LocationSearchBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoCompletePlaceBloc, AutoCompletePlaceState>(
      builder: (context, state) {
        if (state is AutoCompletePlaceLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AutoCompletePlaceLoadedState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your location',
                suffixIcon: const Icon(
                  Icons.search,
                ),
                contentPadding: const EdgeInsets.only(
                  left: 20,
                  bottom: 5,
                  right: 5,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
              ),
              onChanged: (value) {
                context.read<AutoCompletePlaceBloc>().add(LoadAutoCompletePlaceEvent(searchInput: value));
              },
            ),
          );
        } else {
          return Text('Something Went Wrong!');
        }
      },
    );
  }
}
