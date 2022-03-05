import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';

part 'hora_event.dart';
part 'hora_state.dart';

final Pais = [
  "Europe/Andorra",
  "America/Monterrey",
  "America/Lima",
  "America/Toronto",
  "America/Argentina/Catamarca"
];

class horaBloc extends Bloc<horaEvent, horaState> {
  horaBloc() : super(horaInitial()) {
    on<horaEvent>(validate);
  }

  String inicial = "Mexico";

  String url = "http://worldtimeapi.org/api/timezone/" + Pais[1];

  void validate(horaEvent event, Emitter emit) async {
    if (inicial == "Mexico") {
      url = "http://worldtimeapi.org/api/timezone/" + Pais[1];
    } else if (inicial == "Peru") {
      url = "http://worldtimeapi.org/api/timezone/" + Pais[2];
    } else if (inicial == "Canada") {
      url = "http://worldtimeapi.org/api/timezone/" + Pais[3];
    } else if (inicial == "Argentina") {
      url = "http://worldtimeapi.org/api/timezone/" + Pais[4];
    } else if (inicial == "Andorra") {
      url = "http://worldtimeapi.org/api/timezone/" + Pais[0];
    }

    var hora = await tiempo();
    if (hora != null) {
      emit(horadata(data: hora['datetime'].substring(11, 19)));
    } else {
      emit(horaError(error: 'no se pudo obtener la hora'));
    }
    ;
  }

  Future tiempo() async {
    try {
      Response res = await get(Uri.parse(url));
      if (res.statusCode == HttpStatus.ok) {
        var result = jsonDecode(res.body);

        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
