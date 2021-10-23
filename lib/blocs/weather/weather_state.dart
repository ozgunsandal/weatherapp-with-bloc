part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WeatherLoadedState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => [weather];

  final Weather weather;
  const WeatherLoadedState({required this.weather});
}

class WeatherErrorState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
