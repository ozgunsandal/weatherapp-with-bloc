import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_with_bloc/blocs/weather/weather_bloc.dart';

class HavaDurumuResimWidget extends StatelessWidget {
  const HavaDurumuResimWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                (state as WeatherLoadedState)
                        .weather
                        .consolidatedWeather[0]
                        .theTemp
                        .floor()
                        .toString() +
                    " ℃",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Image.network(
                'https://www.metaweather.com/static/img/weather/png/' +
                    (state as WeatherLoadedState)
                        .weather
                        .consolidatedWeather[0]
                        .weatherStateAbbr +
                    '.png',
                width: 150,
                height: 150,
              )
            ],
          ),
        );
      },
    );
  }
}
