import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'paises_event.dart';
part 'paises_state.dart';

class paisesBloc extends Bloc<paisesEvent, paisesState> {
  paisesBloc() : super(paisesInitial()) {
    on<paisesEvent>(validar);
  }

  void validar(paisesEvent event, Emitter emisor) async {
    var mapInfo = await paises();
    mapInfo != null
        ? emisor(paisesData(data: mapInfo))
        : emisor(paisesError(error: "Error al cargar los paises"));
  }

  Future paises() async {
    try {
      Response res = await get(Uri.parse('https://flagcdn.com/en/codes.json'));
      if (res.statusCode == HttpStatus.ok) {
        return jsonDecode(res.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
