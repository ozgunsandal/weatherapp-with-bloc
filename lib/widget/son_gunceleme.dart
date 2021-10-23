import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_with_bloc/blocs/weather/weather_bloc.dart';

class SonGuncellemeWidget extends StatelessWidget {
  const SonGuncellemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, state) {
        var yeniTarih = (state as WeatherLoadedState).weather.time.toLocal();
        return Text(
          'Son Güncelleme ' + TimeOfDay.fromDateTime(yeniTarih).format(context),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
