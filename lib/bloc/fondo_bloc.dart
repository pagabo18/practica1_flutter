import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fondo_event.dart';
part 'fondo_state.dart';

class fondoBloc extends Bloc<fondoEvent, fondoState> {
  fondoBloc() : super(fondoInitial()) {
    on<fondoEvent>(validar);
  }

  void validar(fondoEvent event, Emitter emisor) async {
    var fondo = await importarFondo();
    fondo != null
        ? emisor(fondodata(data: fondo))
        : emisor(fondoError(error: "Error al importar el fondo"));
  }

  Future importarFondo() async {
    final Uri url = Uri(
        scheme: "https",
        host: "picsum.photos",
        path: "seed/${new Random().nextInt(10)}/1000/1500");

    try {
      Response res = await get(url);
      if (res.statusCode == HttpStatus.ok) {
        return res.bodyBytes;
      }
    } catch (e) {
      print(e);
    }
  }
}
