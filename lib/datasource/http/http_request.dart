import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tech_shop/classes/classes.dart';

class HttpRequest {
  Future<List<dynamic>> getJson({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    print(response.body);
    return json.decode(response.body);
  }

  Future<List<dynamic>> postJson(
      {required String url, required Map body}) async {
    http.Response response = await http.post(Uri.parse(url), body: body);
    return json.decode(response.body);
  }

  Future<List<dynamic>> putJson(
      {required String url, required Map body}) async {
    http.Response response = await http.put(Uri.parse(url), body: body);
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> deleteJson({required String url}) async {
    http.Response response = await http.delete(Uri.parse(url));
    return json.decode(response.body);
  }

  Future<http.Response> postLogin({
    required String email,
    required String senha,
    required String nome,
    required String cpf,
    required String telefone,
    required String dataNascimento,
  }) async {
    final _linkLogin = Globais.urlCadastroCliente;
    return http.post(
      Uri.parse(_linkLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "nome": nome,
        "cpf": cpf,
        "telefone": telefone,
        "data_nascimento": dataNascimento,
        "email": email,
        "senha": senha,
      }),
    );
  }
}
