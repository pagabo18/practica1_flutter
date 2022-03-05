part of 'paises_bloc.dart';

abstract class paisesState extends Equatable {
  const paisesState();

  @override
  List<Object> get props => [];
}

class paisesInitial extends paisesState {}

class paisesError extends paisesState {
  final String error;
  paisesError({required this.error});

  @override
  List<Object> get props => [error];
}

class paisesData extends paisesState {
  final Map data;
  paisesData({required this.data});

  @override
  List<Object> get props => [data];
}
