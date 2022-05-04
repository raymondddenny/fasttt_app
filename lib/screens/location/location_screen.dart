import 'dart:async';

import 'package:fasttt/blocs/geolocation/geolocation_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  void initState() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    super.initState();
  }

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
        child: Stack(
          children: [
            BlocBuilder<GeolocationBloc, GeolocationState>(
              builder: (context, state) {
                if (state is GeolocationLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GeolocationLoadedState) {
                  return GMap(
                    lat: state.position.latitude,
                    long: state.position.longitude,
                  );
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              },
            ),
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/logo.svg',
                      height: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(child: LocationSearchBoxWidget()),
                  ],
                ),
              ),
            ),
            Positioned(
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
            ),
          ],
        ),
      ),
    );
  }
}
