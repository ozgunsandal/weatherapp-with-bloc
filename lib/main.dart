import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_with_bloc/blocs/tema/tema_bloc.dart';
import 'package:weatherapp_with_bloc/blocs/weather/weather_bloc.dart';
import 'package:weatherapp_with_bloc/locator.dart';
import 'package:weatherapp_with_bloc/widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(
    BlocProvider<TemaBloc>(
      create: (context) => TemaBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<TemaBloc>(context),
      builder: (BuildContext context, TemaState state) {
        debugPrint((state as UygulamaTemasi).tema.primaryColor.toString());
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: (state as UygulamaTemasi).tema,
          home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(),
            child: WeatherApp(),
          ),
        );
      },
    );
  }
}
