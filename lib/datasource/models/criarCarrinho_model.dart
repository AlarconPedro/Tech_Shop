class CriarCarrinhoModel {
  int idVenda;
  String statusVenda;
  String dataVenda;

  CriarCarrinhoModel({
    required this.idVenda,
    required this.statusVenda,
    required this.dataVenda,
  });

  factory CriarCarrinhoModel.fromJson(Map<String, dynamic> json) =>
      CriarCarrinhoModel(
        idVenda: json["id"],
        statusVenda: json["status"],
        dataVenda: json["data_venda"],
      );
}
