import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_with_bloc/blocs/tema/tema_bloc.dart';
import 'package:weatherapp_with_bloc/blocs/weather/weather_bloc.dart';
import 'package:weatherapp_with_bloc/widget/gecisli_arkaplan_rengi.dart';
import 'package:weatherapp_with_bloc/widget/hava_durumu_resim.dart';
import 'package:weatherapp_with_bloc/widget/location.dart';
import 'package:weatherapp_with_bloc/widget/max_ve_min.dart';
import 'package:weatherapp_with_bloc/widget/sehir_sec.dart';
import 'package:weatherapp_with_bloc/widget/son_gunceleme.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  String kullanicidanDonenSehir = 'Ankara';
  late Completer<void> _refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final _temaBloc = BlocProvider.of<TemaBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () async {
              kullanicidanDonenSehir = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SehirSecWidget(),
                ),
              );
              debugPrint(kullanicidanDonenSehir);
              _weatherBloc.add(
                FetchWeatherEvent(sehirAdi: kullanicidanDonenSehir),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(
                child: Text('Şehir Seçiniz'),
              );
            }
            if (state is WeatherLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoadedState) {
              final getirilenWeather = state.weather;
              final _havaDurumKisaltma =
                  getirilenWeather.consolidatedWeather[0].weatherStateAbbr;
              _temaBloc.add(
                  TemaDegistirEvent(havaDurumuKisaltmasi: _havaDurumKisaltma));
              kullanicidanDonenSehir = getirilenWeather.title;
              _refreshCompleter.complete();
              _refreshCompleter = Completer();
              return BlocBuilder(
                bloc: _temaBloc,
                builder: (context, state) {
                  return GecisliRenkContainer(
                    renk: (state as UygulamaTemasi).renk,
                    child: RefreshIndicator(
                      onRefresh: () {
                        _weatherBloc.add(
                          RefreshWeatherEvent(sehirAdi: kullanicidanDonenSehir),
                        );
                        return _refreshCompleter.future;
                      },
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: LocationWidget(
                              secilenSehir: getirilenWeather.title,
                            )),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: SonGuncellemeWidget()),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: HavaDurumuResimWidget()),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: MaxVeMinSicaklikWidget()),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is WeatherErrorState) {
              return Center(
                child: Text('Hata Oluştu'),
              );
            }
            return Center(
              child: Text('Yükleniyor'),
            );
          },
        ),
      ),
    );
  }
}
