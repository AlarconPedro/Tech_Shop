class TbCarrinho {
  static const String nomeTabela = "TbUsuario";
  static const String idColumn = "id";
  static const String idProdutoColumn = "idProduto";
  static const String valorProdutoColumn = "valorProduto";
  static const String qtdeProdutoColumn = "qtdeProduto";
  static const String valorTotalColumn = "valorTotal";

  static const String scriptCreateTable = '''
    CREATE TABLE $nomeTabela (
      $idColumn INTEGER PRIMARY KEY,
      $idProdutoColumn INTEGER,
      $qtdeProdutoColumn INTEGER,
      $valorProdutoColumn REAL,
      $valorTotalColumn REAL
    )
  ''';
  int? id = 0;
  int idProduto = 0;
  int qtdeProduto = 0;
  double valorProduto = 0;
  double valorTotal = 0;

  TbCarrinho();

  TbCarrinho.fromMap(Map map) {
    id = map[idColumn];
    idProduto = map[idProdutoColumn];
    valorProduto = map[valorProdutoColumn];
    valorTotal = map[valorTotalColumn];
    qtdeProduto = map[qtdeProdutoColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      idColumn: id,
      idProdutoColumn: idProduto,
      valorProdutoColumn: valorProduto,
      valorTotalColumn: valorTotal,
      qtdeProdutoColumn: qtdeProduto,
    };
    return map;
  }
}
