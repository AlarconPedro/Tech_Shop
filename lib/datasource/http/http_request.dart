import 'dart:convert';
import 'package:http/http.dart' as http;

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
}
