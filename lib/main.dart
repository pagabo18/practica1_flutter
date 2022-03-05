import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'bloc/fondo_bloc.dart';
import 'bloc/frase_bloc.dart';
import 'bloc/hora_bloc.dart';
import 'bloc/paises_bloc.dart';
import './homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeatureDiscovery.withProvider(
        persistenceProvider: NoPersistenceProvider(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => paisesBloc()..add(paisesAddEvent())),
            BlocProvider(
                create: (context) => fraseBloc()..add(fraseAddEvent())),
            BlocProvider(
                create: (context) => fondoBloc()..add(fondoAddEvent())),
            BlocProvider(create: (context) => horaBloc()..add(horaAddEvent())),
          ],
          child: Homepage(),
        ),
      ),
    );
  }
}
