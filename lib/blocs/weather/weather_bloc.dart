import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp_with_bloc/data/weather_repository.dart';
import 'package:weatherapp_with_bloc/locator.dart';
import 'package:weatherapp_with_bloc/models/weather.dart';
import 'package:flutter/material.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is FetchWeatherEvent) {
        // Verileri çağırıken kullandığımız event
        emit(WeatherLoadingState());
        try {
          final Weather getirilenWeather =
              await weatherRepository.getWeather(event.sehirAdi);
          emit(WeatherLoadedState(weather: getirilenWeather));
        } catch (e) {
          debugPrint('Hata ' + e.toString());
          emit(WeatherErrorState());
        }
      } else if (event is RefreshWeatherEvent) {
        // Ekranı aşağı doğru çekince verilen refreshlenmesinde kullandığımız event
        try {
          final Weather getirilenWeather =
              await weatherRepository.getWeather(event.sehirAdi);
          emit(WeatherLoadedState(weather: getirilenWeather));
        } catch (e) {
          emit(
              state); // Refreshte hat varsa sayfa current state'te kalsın diyoruz
        }
      }
    });
  }
}
