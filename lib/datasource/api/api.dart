import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tech_shop/classes/globais.dart';
import 'package:tech_shop/datasource/http/http.dart';
import 'package:tech_shop/datasource/local/querys/tb_usuario_helper.dart';
import 'package:tech_shop/datasource/models/criarCarrinho_model.dart';
import 'package:tech_shop/datasource/models/endereco_model.dart';
import 'package:tech_shop/datasource/models/login_model.dart';
import 'package:tech_shop/datasource/models/models.dart';

import '../models/carrinho_model.dart';

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
    String url = Globais.urlEnderecoId + Globais.idCliente.toString();
    var response = await request.getJson(url: url);
    print(response);
    return _populateEnderecos(response);
  }

  List<EnderecoModel> _populateEnderecos(List<dynamic> json) {
    return json.map((e) => EnderecoModel.fromJson(e)).toList();
  }

  Future<List<ProdutoModel>> getItensCarrinho() async {
    String url = Globais.urlItensCarrinho + Globais.idCliente.toString();
    var response = await request.getCarrinho(url: url);
    Globais.vendaId = response['venda_id'].toInt();
    TbUsuarioHelper().insertCodigoVenda(Globais.vendaId);
    return _populateItensCarrinho(
      CarrinhoModel(
        vendaId: response['venda_id'],
        valorTotal: response['valor_total'],
        status: response['status'],
        data: response['data_atualizacao'],
        cliente: response['cliente'],
      ),
      _populateProdutosCarrinho(response['produtos']),
    );
  }

  Future<String> getValorTotalCarrinho() async {
    String url = Globais.urlItensCarrinho + Globais.idCliente.toString();
    var response = await request.getCarrinho(url: url);
    return response['valor_total'];
  }

  List<ProdutoModel> _populateProdutosCarrinho(List<dynamic> carrinho) {
    var response = carrinho.map((e) => ProdutoModel.fromJson(e)).toList();
    return response;
  }

  List<ProdutoModel> _populateItensCarrinho(
      CarrinhoModel json, List<ProdutoModel> produtosCarrinho) {
    List<ProdutoModel> produtos = [];
    Globais.valorTotalCarrinho = json.valorTotal;
    produtosCarrinho.forEach((element) {
      produtos.add(element);
      // for (var item in json.produtos) {
      //   Globais.valorTotalCarrinho = json.valorTotal;
      //   produtos.add(ProdutoModel.fromJson(item));
      // }
    });

    return produtos;
    // return json.map((e) => ProdutoModel.fromJson(e)).toList();
  }

  //POST FUNCTIONS
  Future<List<LoginModel>> postLogin({
    required String nome,
    required String cpf,
    required String dataNascimento,
    required String email,
    required String senha,
  }) async {
    var body = json.encode({
      "email": email,
      "senha": senha,
      "nome": nome,
      "cpf": cpf,
      "data_nascimento": dataNascimento
    });
    var response =
        await request.postJson(url: Globais.urlLogin, body: body, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });

    return _populateLogin(response);
  }

  List<LoginModel> _populateLogin(List<dynamic> json) {
    return json.map((e) => LoginModel.fromJson(e)).toList();
  }

  void criarCarrinho(int idCliente, ProdutoModel produtoModel) async {
    var response =
        await request.postVenda(url: Globais.urlCriarCarrinho, body: {
      "cliente_id": Globais.idCliente.toString(),
      "usuario_id": idCliente.toString(),
      "status": "A",
    });
    Globais.vendaId = CriarCarrinhoModel.fromJson(response).idVenda;
    API().adicionarAoCarrinho(
      valor: produtoModel.preco,
      produtoId: produtoModel.id,
      quantidade: 1,
      vendaId: Globais.vendaId,
    );
  }

  // PUT FUNCTIONS
  void adicionarAoCarrinho({
    double? valor,
    required int produtoId,
    int? quantidade,
    required int vendaId,
  }) async {
    var response = await request.postVenda(
      url: Globais.urlAddItemCarrinho,
      body: {
        "valor": valor.toString(),
        "venda_id": Globais.vendaId.toString(),
        "produto_id": produtoId.toString(),
        "quantidade": quantidade.toString(),
      },
    );
  }

  void addCarrinho({required int produtoId, required int vendaId}) async {
    var body = json.encode({
      "produto_id": produtoId.toString(),
      "venda_id": vendaId.toString(),
    });
    request.postJson(url: Globais.urlAddItemCarrinho, body: body, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }

  void retirarDoCarrinho(int produtoId, int vendaId) async {
    var body = json.encode({
      "produto_id": produtoId.toString(),
      "venda_id": vendaId.toString(),
    });
    request.postJson(
      url: Globais.urlRetiraItemCarrinho,
      body: body,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  // DELETE FUNCTIONS
  void deleteEndereco(String id) async {
    String url = Globais.urlDeleteEndereco + id;
    var response = await request.deleteJson(url: url);
    print(response);
  }

  void removerDoCarrinho(int produtoId, int vendaId) async {
    var body = json.encode({
      "produto_id": produtoId.toString(),
      "venda_id": vendaId.toString(),
    });
    request.postJson(
      url: Globais.urlDeleteItemCarrinho,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
  }
}
