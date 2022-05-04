import 'package:fasttt/blocs/geolocation/geolocation_bloc.dart';
import 'package:fasttt/config/app_router.dart';
import 'package:fasttt/config/theme.dart';
import 'package:fasttt/repositories/geolocation/geolocation_repository.dart';
import 'package:fasttt/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => GeolocationRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GeolocationBloc(geolocationRepository: context.read<GeolocationRepository>())
              ..add(LoadGeoLocationEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: themeData(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: LocationScreen.routeName,
        ),
      ),
    );
  }
}
