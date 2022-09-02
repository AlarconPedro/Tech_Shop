class ProdutoModel {
  int id;
  int categoriaId;
  int status;
  String creadoEm;
  String atualizadoEm;
  String nome;
  String descricao;
  String imagem1;
  String imagem2;
  String imagem3;
  String imagem4;
  String imagem5;
  int preco;
  int precoPromocional;

  ProdutoModel({
    required this.id,
    required this.categoriaId,
    required this.status,
    required this.creadoEm,
    required this.atualizadoEm,
    required this.nome,
    required this.descricao,
    required this.imagem1,
    required this.imagem2,
    required this.imagem3,
    required this.imagem4,
    required this.imagem5,
    required this.preco,
    required this.precoPromocional,
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      id: json['id'],
      categoriaId: json['categoria_id'],
      status: json['status'],
      creadoEm: json['created_at'],
      atualizadoEm: json['updated_at'],
      nome: json['nome'],
      descricao: json['descricao'],
      imagem1: json['imagem1'],
      imagem2: json['imagem2'],
      imagem3: json['imagem3'],
      imagem4: json['imagem4'],
      imagem5: json['imagem5'],
      preco: json['preco'],
      precoPromocional: json['preco_promocional'],
    );
  }

  List<dynamic> imageToJson() {
    final List data = [imagem1, imagem2, imagem3, imagem4, imagem5];
    return data;
  }
}
