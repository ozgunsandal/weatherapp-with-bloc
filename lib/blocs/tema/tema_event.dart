part of 'tema_bloc.dart';

abstract class TemaEvent extends Equatable {
  const TemaEvent();
}

class TemaDegistirEvent extends TemaEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [havaDurumuKisaltmasi];

  //********* Hava durumuna göre temayı değiştireceğiz.

  final String havaDurumuKisaltmasi;
  TemaDegistirEvent({required this.havaDurumuKisaltmasi});
}
