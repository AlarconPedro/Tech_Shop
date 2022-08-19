import 'package:http/http.dart' as http;
import 'package:tech_shop/classes/globais.dart';
import 'package:tech_shop/datasource/http/http.dart';
import 'package:tech_shop/datasource/models/models.dart';

class API {
  final request = HttpRequest();

  Future<List<CategoriaModel>> getCategorias() async {
    var response = await request.getJson(url: Globais.urlCategorias);
    return _populateCategorias(response);
  }

  List<CategoriaModel> _populateCategorias(List<dynamic> json) {
    return json.map((e) => CategoriaModel.fromJson(e)).toList();
  }
}
