import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_shop/classes/globais.dart';
import 'package:tech_shop/datasource/http/http.dart';
import 'package:tech_shop/datasource/models/endereco_model.dart';
import 'package:tech_shop/datasource/models/login_model.dart';
import 'package:tech_shop/datasource/models/models.dart';

class API {
  final request = HttpRequest();

  // GET FUNCTIONS
  Future<List<CategoriaModel>> getCategorias() async {
    var response = await request.getJson(url: Globais.urlCategorias);
    return _populateCategorias(response);
  }

  List<CategoriaModel> _populateCategorias(List<dynamic> json) {
    return json.map((e) => CategoriaModel.fromJson(e)).toList();
  }

  Future<List<ProdutoModel>> getProdutos(int id) async {
    var response = await request.getJson(
        url: Globais.urlProdutoCategoriaId + id.toString());
    return _populateProdutos(response);
  }

  List<ProdutoModel> _populateProdutos(List<dynamic> json) {
    return json.map((e) => ProdutoModel.fromJson(e)).toList();
  }

  Future<List<ProdutoModel>> getRadomSugestion(int id, int produtoId) async {
    var response = await request.getJson(
        url: Globais.urlRandon + id.toString() + "/random");
    return _populaRandomSugestion(response);
  }

  List<ProdutoModel> _populaRandomSugestion(List<dynamic> json) {
    return json.map((e) => ProdutoModel.fromJson(e)).toList();
  }

  Future<List<ProdutoModel>> getProdutosRandom() async {
    var response = await request.getJson(url: Globais.urlProdutosRandom);
    return _populateProdutosRandom(response);
  }

  List<ProdutoModel> _populateProdutosRandom(List<dynamic> json) {
    return json.map((e) => ProdutoModel.fromJson(e)).toList();
  }

  Future<List<EnderecoModel>> getEnderecos() async {
    String url = Globais.urlEnderecoId + Globais.idCliente;
    var response = await request.getJson(url: url);
    print(response);
    return _populateEnderecos(response);
  }

  List<EnderecoModel> _populateEnderecos(List<dynamic> json) {
    return json.map((e) => EnderecoModel.fromJson(e)).toList();
  }

  //POST FUNCTIONS
  Future<List<LoginModel>> postLogin({
    required String nome,
    required String cpf,
    required String dataNascimento,
    required String email,
    required String senha,
  }) async {
    var response = await request.postJson(url: Globais.urlLogin, body: {
      "email": email,
      "senha": senha,
      "nome": nome,
      "cpf": cpf,
      "data_nascimento": dataNascimento
    });
    return _populateLogin(response);
  }

  List<LoginModel> _populateLogin(List<dynamic> json) {
    return json.map((e) => LoginModel.fromJson(e)).toList();
  }

  // PUT FUNCTIONS

  // DELETE FUNCTIONS
  void deleteEndereco(String id) async {
    String url = Globais.urlDeleteEndereco + id;
    var response = await request.deleteJson(url: url);
    print(response);
  }
}
