class ProdutoModel {
  int id;
  int categoriaId;
  String nome;
  String descricao;
  String imagem1;
  String imagem2;
  String imagem3;
  String imagem4;
  String imagem5;
  double preco;
  int? precoPromocional;
  int? quantidade;

  ProdutoModel({
    required this.id,
    required this.categoriaId,
    required this.nome,
    required this.descricao,
    required this.imagem1,
    required this.imagem2,
    required this.imagem3,
    required this.imagem4,
    required this.imagem5,
    required this.preco,
    required this.precoPromocional,
    required this.quantidade,
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      id: json['id'] ?? 0,
      categoriaId: json['categoria_id'] ?? 0,
      nome: json['nome'],
      descricao: json['descricao'],
      imagem1: json['imagem1'] ?? '',
      imagem2: json['imagem2'] == "" ? "" : json['imagem1'] ?? '',
      imagem3: json['imagem3'] == "" ? "" : json['imagem1'] ?? '',
      imagem4: json['imagem4'] == "" ? "" : json['imagem1'] ?? '',
      imagem5: json['imagem5'] == "" ? "" : json['imagem1'] ?? '',
      preco: json['preco'].toDouble(),
      precoPromocional: json['preco_promocional'],
      quantidade: json['quantidade'],
    );
  }

  List<dynamic> imageToJson() {
    final List data = [
      imagem1,
      imagem2 == "" ? imagem1 : imagem2,
      imagem3 == "" ? imagem1 : imagem3,
      imagem4 == "" ? imagem1 : imagem4,
      imagem5 == "" ? imagem1 : imagem5,
    ];
    return data;
  }
}
