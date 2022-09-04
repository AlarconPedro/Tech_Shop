import 'package:http/http.dart' as http;
import 'package:tech_shop/classes/globais.dart';
import 'package:tech_shop/datasource/http/http.dart';
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

  //POST FUNCTIONS
  Future<List<ProdutoModel>> postLogin(
      {required String email, required String senha}) async {
    var response = await request.postJson(
        url: Globais.urlLogin, body: {"email": email, "senha": senha});
    return _populateLogin(response);
  }

  List<ProdutoModel> _populateLogin(List<dynamic> json) {
    return json.map((e) => ProdutoModel.fromJson(e)).toList();
  }
}
