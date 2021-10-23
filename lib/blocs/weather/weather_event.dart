part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [sehirAdi];

  final String sehirAdi;
  FetchWeatherEvent({required this.sehirAdi});
}

class RefreshWeatherEvent extends WeatherEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [sehirAdi];

  final String sehirAdi;
  RefreshWeatherEvent({required this.sehirAdi});
}
