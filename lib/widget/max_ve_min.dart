import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_with_bloc/blocs/weather/weather_bloc.dart';

class MaxVeMinSicaklikWidget extends StatelessWidget {
  const MaxVeMinSicaklikWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Max : ' +
                  (state as WeatherLoadedState)
                      .weather
                      .consolidatedWeather[0]
                      .maxTemp
                      .floor()
                      .toString() +
                  " ℃",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Min : ' +
                  (state as WeatherLoadedState)
                      .weather
                      .consolidatedWeather[0]
                      .minTemp
                      .floor()
                      .toString() +
                  " ℃",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        );
      },
    );
  }
}
