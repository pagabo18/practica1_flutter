part of 'paises_bloc.dart';

abstract class paisesEvent extends Equatable {
  const paisesEvent();

  @override
  List<Object> get props => [];
}

class paisesAddEvent extends paisesEvent {}
