import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'frase_event.dart';

part 'frase_state.dart';

class fraseBloc extends Bloc<fraseEvent, fraseState> {
  fraseBloc() : super(fraseInitial()) {
    on<fraseEvent>(validar);
  }

  void validar(fraseEvent event, Emitter emit) async {
    var api = await frase();

    if (api != null) {
      final String author = api[0]["a"];
      final String quote = api[0]["q"];

      emit(frasedata(autor: ("--" + author + "--"), frase: quote));
    } else {
      emit(fraseError(error: 'No se pudo obtener la frase'));
    }
  }

  Future frase() async {
    try {
      Response response =
          await get(Uri.parse("https://zenquotes.io/api/random"));
      if (response.statusCode == HttpStatus.ok) {
        var result = jsonDecode(response.body);

        return result;
      }
    } catch (e) {
      print(e);
    }
  }
}
