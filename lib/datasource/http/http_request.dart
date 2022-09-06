import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tech_shop/classes/classes.dart';

class HttpRequest {
  Future<List<dynamic>> getJson({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future<List<dynamic>> postJson(
      {required String url, required Map body}) async {
    http.Response response = await http.post(Uri.parse(url), body: body);
    return json.decode(response.body);
  }

  Future<http.Response> postLogin({
    required String email,
    required String senha,
    required String nome,
    required String cpf,
    required String dataNascimento,
  }) async {
    final _linkLogin = Globais.urlLogin;
    return http.post(
      Uri.parse(_linkLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "telefone": "123456",
        "senha": senha,
        "nome": nome,
        "cpf": cpf,
        "data_nascimento": dataNascimento
      }),
    );
  }
}
