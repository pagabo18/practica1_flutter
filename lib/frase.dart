import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/frase_bloc.dart';

class frases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<fraseBloc, fraseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is fraseError) {
          return const Center(child: Text("Error"));
        } else if (state is frasedata) {
          return ListTile(
            title: Text(state.frase,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            subtitle: Text(state.autor,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                )),
          );
        } else {
          return Center(child: new CircularProgressIndicator());
        }
      },
    );
  }
}
