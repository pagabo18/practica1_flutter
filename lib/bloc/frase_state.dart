part of 'frase_bloc.dart';

abstract class fraseState extends Equatable {
  const fraseState();

  @override
  List<Object> get props => [];
}

class fraseInitial extends fraseState {}

class fraseError extends fraseState {
  final String error;
  fraseError({required this.error});

  @override
  List<Object> get props => [error];
}

class frasedata extends fraseState {
  String frase;
  String autor;

  frasedata({required this.autor, required this.frase});

  @override
  List<Object> get props => [autor];
}
