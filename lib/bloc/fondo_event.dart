part of 'fondo_bloc.dart';

abstract class fondoEvent {
  const fondoEvent();
  @override
  List<Object?> get props => [];
}

class fondoAddEvent extends fondoEvent {}
