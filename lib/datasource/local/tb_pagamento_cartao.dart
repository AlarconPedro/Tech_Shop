class TbPagamentoCartao {
  static const String nomeTabela = 'TbPagamentoCartao';
  static const String idColumn = 'id';
  static const String numeroColumn = 'numero';
  static const String validadeColumn = 'validade';
  static const String cvvColumn = 'cvv';
  static const String nomeTitularColumn = 'nomeTitular';

  static const String scriptCreateTable = '''
    CREATE TABLE $nomeTabela (
      $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
      $numeroColumn TEXT,
      $validadeColumn TEXT,
      $cvvColumn TEXT,
      $nomeTitularColumn TEXT
    )
  ''';

  int id = 0;
  String bandeira = '';
  String numero = '';
  String validade = '';
  String cvv = '';
  String nomeTitular = '';

  TbPagamentoCartao();

  TbPagamentoCartao.fromMap(Map map) {
    id = map[idColumn];
    numero = map[numeroColumn];
    validade = map[validadeColumn];
    cvv = map[cvvColumn];
    nomeTitular = map[nomeTitularColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      idColumn: id,
      numeroColumn: numero,
      validadeColumn: validade,
      cvvColumn: cvv,
      nomeTitularColumn: nomeTitular,
    };
    return map;
  }
}
