import 'dart:async';

import 'package:fasttt/blocs/auto_complete_place/auto_complete_place_bloc.dart';
import 'package:fasttt/blocs/geolocation/geolocation_bloc.dart';
import 'package:fasttt/blocs/place/place_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:location/location.dart';

import '../../widgets/widgets.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var location = Location();

  late var serviceEnabled;
  late var _permissionGranted;

  @override
  void didChangeDependencies() async {
    serviceEnabled = await location.serviceEnabled();
    checkServiceEnabled();
    _permissionGranted = await location.hasPermission();
    checkPermissionGranted();

    super.didChangeDependencies();
  }

  void checkServiceEnabled() async {
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
  }

  void checkPermissionGranted() async {
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PlaceBloc, PlaceState>(
          builder: (context, state) {
            if (state is PlaceInitialState) {
              return Stack(
                children: [
                  BlocBuilder<GeolocationBloc, GeolocationState>(
                    builder: (context, state) {
                      if (state is GeolocationLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GeolocationLoadedState) {
                        return MapBoxMap(
                          lat: state.position.longitude,
                          long: state.position.latitude,
                        );
                      } else {
                        return const Center(child: Text('Something went wrong'));
                      }
                    },
                  ),
                  const SaveButtonWidget(),
                  const LocationSearchWidget(),
                ],
              );
            }
            if (state is PlaceLoadingState) {
              return Stack(
                children: const [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  SaveButtonWidget(),
                  LocationSearchWidget(),
                ],
              );
            } else if (state is PlaceLoadedState) {
              final double lat = state.place.geometry!.coordinates!.first;
              final double long = state.place.geometry!.coordinates!.last;
              // final double lat = state.lat;
              // final double long = state.long;

              debugPrint('lat: $lat, long: $long');
              return Stack(
                children: [
                  MapBoxMap(
                    lat: lat,
                    long: long,
                  ),
                  const SaveButtonWidget(),
                  const LocationSearchWidget(),
                ],
              );
            } else {
              return const Center(
                child: Text('Something went wrong!!'),
              );
            }
          },
        ),
      ),
    );
  }
}

class LocationSearchWidget extends StatelessWidget {
  const LocationSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
            height: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                const LocationSearchBoxWidget(),
                BlocBuilder<AutoCompletePlaceBloc, AutoCompletePlaceState>(
                  builder: (context, state) {
                    if (state is AutoCompletePlaceLoadingState) {
                      return Container(
                          margin: const EdgeInsets.all(8),
                          height: 80,
                          color: Colors.black.withOpacity(0.4),
                          child: const Center(child: CircularProgressIndicator()));
                    } else if (state is AutoCompletePlaceLoadedState) {
                      return state.autoComplete.isEmpty
                          ? const SizedBox()
                          : Container(
                              margin: const EdgeInsets.all(8),
                              height: 300,
                              color: Colors.black.withOpacity(0.4),
                              child: ListView.builder(
                                itemCount: state.autoComplete.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () async {
                                      context
                                          .read<PlaceBloc>()
                                          .add(SelectedPlaceEvent(place: state.autoComplete[index]));

                                      FocusScope.of(context).unfocus();

                                      // context
                                      //     .read<AutoCompletePlaceBloc>()
                                      //     .add(const LoadAutoCompletePlaceEvent());
                                    },
                                    title: Text(
                                      state.autoComplete[index].placeName!,
                                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                                    ),
                                  );
                                },
                              ),
                            );
                    }
                    //  else if (state is AutoCompletePlaceSelectedState) {
                    //   mapController?.animateCamera(
                    //     CameraUpdate.newLatLng(LatLng(
                    //         state.place.geometry!.coordinates!.first, state.place.geometry!.coordinates!.last)),
                    //   );
                    //   return const SizedBox();
                    // }
                    else {
                      return const Center(
                        child: Text('Something went wrong!'),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 20,
      right: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Save',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
