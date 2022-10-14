class CriarCarrinhoModel {
  int idVenda;
  String usuarioId;
  String statusVenda;
  String dataVenda;

  CriarCarrinhoModel({
    required this.idVenda,
    required this.statusVenda,
    required this.dataVenda,
    required this.usuarioId,
  });

  factory CriarCarrinhoModel.fromJson(Map<String, dynamic> json) =>
      CriarCarrinhoModel(
        idVenda: json["id"],
        statusVenda: json["status"],
        dataVenda: json["data_venda"],
        usuarioId: json["usuario_id"],
      );
}
