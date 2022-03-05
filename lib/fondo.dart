import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/fondo_bloc.dart';

class fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<fondoBloc, fondoState>(
      builder: (context, state) {
        if (state is fondoError) {
          return Center(child: Text("Error"));
        } else if (state is fondodata) {
          return Image.memory(state.data,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center);
        } else {
          return Center(child: new CircularProgressIndicator());
        }
      },
      listener: (context, state) {},
    );
  }
}
