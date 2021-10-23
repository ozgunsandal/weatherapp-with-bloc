part of 'tema_bloc.dart';

abstract class TemaState extends Equatable {
  const TemaState();
}

class UygulamaTemasi extends TemaState {
  @override
  List<Object> get props => [tema, renk];

  final ThemeData tema;
  final MaterialColor renk;

  UygulamaTemasi({required this.tema, required this.renk});
}
