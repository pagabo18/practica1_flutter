import 'package:backdrop/backdrop.dart';
import 'package:examen_1/bloc/fondo_bloc.dart';
import 'package:examen_1/bloc/hora_bloc.dart';
import 'package:examen_1/frase.dart';
import 'package:examen_1/hora.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Flags.dart';
import 'bloc/frase_bloc.dart';
import 'bloc/paises_bloc.dart';
import 'bloc/hora_bloc.dart';
import 'fondo.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BackdropScaffold(
      stickyFrontLayer: false,
      headerHeight: 300,
      backLayerBackgroundColor: Color.fromRGBO(153, 64, 97, 1),
      appBar: BackdropAppBar(
        backgroundColor: Color.fromRGBO(153, 64, 97, 1),
        title: const Text("La frase diaria"),
        actions: const <Widget>[
          BackdropToggleButton(icon: AnimatedIcons.list_view)
        ],
      ),
      backLayer: BlocConsumer<paisesBloc, paisesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is paisesError) {
            return Text(state.error);
          } else if (state is paisesData) {
            return Container(
              height: 400,
              constraints: new BoxConstraints(),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.data.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = state.data.keys.elementAt(index);
                  if (key == "ad" ||
                      key == "mx" ||
                      key == "pe" ||
                      key == "ca" ||
                      key == "ar") {
                    return TextButton(
                      child: SizedBox(
                        height: 90,
                        child: Row(
                          children: <Widget>[
                            const Padding(padding: EdgeInsets.all(8)),
                            Image.network(
                              "https://flagcdn.com/w20/" + key + ".png",
                            ),
                            const Padding(padding: EdgeInsets.all(8)),
                            Text(
                              state.data[key],
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<horaBloc>(context).inicial =
                            state.data[key];
                        BlocProvider.of<horaBloc>(context).add(horaAddEvent());
                        BlocProvider.of<fondoBloc>(context)
                            .add(fondoAddEvent());
                        BlocProvider.of<fraseBloc>(context)
                            .add(fraseAddEvent());
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            );
          } else {
            return Center(
                child: new CircularProgressIndicator(color: Colors.deepPurple));
            ;
          }
        },
      ),
      frontLayer: Stack(
        children: <Widget>[
          //fondo
          fondo(),

          Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 12.0),
                  child: Column(
                    children: [
                      //hora
                      hora(),
                      SizedBox(height: 150),
                      //frase
                      frases(),
                    ],
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
