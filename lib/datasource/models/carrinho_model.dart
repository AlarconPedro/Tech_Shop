import 'package:tech_shop/datasource/models/models.dart';

class CarrinhoModel {
  int vendaId;
  String valorTotal;
  List<dynamic> produtos;
  String status;
  String data;
  String cliente;

  CarrinhoModel({
    required this.vendaId,
    required this.valorTotal,
    required this.produtos,
    required this.status,
    required this.data,
    required this.cliente,
  });

  factory CarrinhoModel.fromJson(Map<String, dynamic> json) {
    return CarrinhoModel(
      vendaId: json['venda_id'],
      valorTotal: json['valor_total'],
      produtos: json['produtos'],
      status: json['status'],
      data: json['data'],
      cliente: json['cliente'],
    );
  }
}
