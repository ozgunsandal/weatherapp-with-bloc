import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tema_event.dart';
part 'tema_state.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  TemaBloc()
      : super(UygulamaTemasi(tema: ThemeData.light(), renk: Colors.blue)) {
    on<TemaEvent>((event, emit) async {
      UygulamaTemasi? uygulamaTemasi;
      if (event is TemaDegistirEvent) {
        switch (event.havaDurumuKisaltmasi) {
          case 'sn': // json'dan gelen weather_state_abbr değeri (karlı demek) api'nin dökümanında yazıyor
          case 'sl': // sulu karlı
          case 'h': //dolu yağışlı
          case 't': //fırtınalı
          case 'hc': //çok bulutlu
            uygulamaTemasi =
                UygulamaTemasi(tema: ThemeData.dark(), renk: Colors.grey);
            break;
          case 'hr': //ağır yağmurlu
          case 'lr': //hafif yağmurlu
          case 's': //sağanak yağışlı

            uygulamaTemasi =
                UygulamaTemasi(tema: ThemeData.dark(), renk: Colors.blue);
            break;
          case 'lc': //az bulutlu
          case 'c': //açık hava
            uygulamaTemasi =
                UygulamaTemasi(tema: ThemeData.light(), renk: Colors.yellow);
            break;
        }
        emit(uygulamaTemasi!);
      }
    });
  }
}
