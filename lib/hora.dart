import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/hora_bloc.dart';

class hora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<horaBloc, horaState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is horaError) {
          return Center(child: Text("Error"));
        } else if (state is horadata) {
          return Column(
            children: [
              Center(
                  child: Text(
                state.data,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontStyle: FontStyle.italic,
                ),
              )),
            ],
          );
        } else {
          return Center(child: new CircularProgressIndicator());
        }
      },
    );
  }
}
