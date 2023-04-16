import 'dart:convert';
import 'package:http/http.dart';
import '../model/feriado_model.dart';

class HttpService {
  Future<List<Feriado>> getFeriados() async {
    Response response =
        await get(Uri.parse("https://brasilapi.com.br/api/feriados/v1/2023"));

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      List<Feriado> feriados =
          json.map((item) => Feriado.fromJson(item)).toList();
      return feriados;
    } else {
      throw "Não foi possível recuperar os feriados.";
    }
  }
}
