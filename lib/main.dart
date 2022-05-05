import 'package:fasttt/blocs/auto_complete_place/auto_complete_place_bloc.dart';
import 'package:fasttt/blocs/geolocation/geolocation_bloc.dart';
import 'package:fasttt/blocs/place/place_bloc.dart';
import 'package:fasttt/config/app_router.dart';
import 'package:fasttt/config/theme.dart';
import 'package:fasttt/repositories/repository.dart';
import 'package:fasttt/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (context) => GeolocationRepository(),
        ),
        RepositoryProvider<PlacesRepository>(
          create: (context) => PlacesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GeolocationBloc(geolocationRepository: context.read<GeolocationRepository>())
              ..add(LoadGeoLocationEvent()),
          ),
          BlocProvider(
            create: (context) => AutoCompletePlaceBloc(placesRepository: context.read<PlacesRepository>())
              ..add(const LoadAutoCompletePlaceEvent()),
          ),
          BlocProvider(
            create: (context) => PlaceBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: themeData(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}
