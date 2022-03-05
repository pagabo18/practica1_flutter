part of 'frase_bloc.dart';

abstract class fraseEvent extends Equatable {
  const fraseEvent();

  @override
  List<Object> get props => [];
}

class fraseAddEvent extends fraseEvent {}
