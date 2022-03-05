part of 'hora_bloc.dart';

abstract class horaState {
  const horaState();

  @override
  List<Object?> get props => [];
}

class horaInitial extends horaState {}

class horaError extends horaState {
  final String error;

  horaError({required this.error});
  @override
  List<String?> get props => [error];
}

class horadata extends horaState {
  final String data;

  horadata({required this.data});
  @override
  List<Object?> get props => [data];
}
