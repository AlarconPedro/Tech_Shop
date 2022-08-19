class CategoriaModel {
  int id;
  int status;
  String nome;
  String icone;
  String criadoEm;
  String atualizadoEm;

  CategoriaModel({
    required this.id,
    required this.status,
    required this.nome,
    required this.icone,
    required this.criadoEm,
    required this.atualizadoEm,
  });

  factory CategoriaModel.fromJson(Map<String, dynamic> json) {
    return CategoriaModel(
      id: json['id'],
      status: json['status'],
      nome: json['nome'],
      icone: json['icone'],
      criadoEm: json['created_at'],
      atualizadoEm: json['updated_at'],
    );
  }
}
