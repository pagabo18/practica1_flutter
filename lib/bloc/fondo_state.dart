part of 'fondo_bloc.dart';

abstract class fondoState extends Equatable {
  const fondoState();

  @override
  List<Object> get props => [];
}

class fondoInitial extends fondoState {}

class fondoError extends fondoState {
  final String error;
  fondoError({required this.error});

  @override
  List<Object> get props => [error];
}

class fondodata extends fondoState {
  final Uint8List data;
  fondodata({required this.data});

  @override
  List<Object> get props => [data];
}
