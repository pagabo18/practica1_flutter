part of 'hora_bloc.dart';

abstract class horaEvent {
  const horaEvent();
  @override
  List<Object?> get props => [];
}

class horaAddEvent extends horaEvent {}
