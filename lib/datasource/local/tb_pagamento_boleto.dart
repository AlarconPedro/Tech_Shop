class TbPagamentoBoleto {
  static const String nomeTabela = 'TbPagamentoBoleto';
  static const String idColumn = 'id';
  static const String codigoBarrasColumn = 'codigoBarras';
  static const String linhaDigitavelColumn = 'linhaDigitavel';
  static const String dataVencimentoColumn = 'dataVencimento';
  static const String valorColumn = 'valor';

  static const String scriptCreateTable = '''
    CREATE TABLE $nomeTabela (
      $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
      $codigoBarrasColumn TEXT,
      $linhaDigitavelColumn TEXT,
      $dataVencimentoColumn TEXT,
      $valorColumn REAL
    )
  ''';

  int id = 0;
  String codigoBarras = '';
  String linhaDigitavel = '';
  String dataVencimento = '';
  double valor = 0.0;

  TbPagamentoBoleto();

  TbPagamentoBoleto.fromMap(Map map) {
    id = map[idColumn];
    codigoBarras = map[codigoBarrasColumn];
    linhaDigitavel = map[linhaDigitavelColumn];
    dataVencimento = map[dataVencimentoColumn];
    valor = map[valorColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      idColumn: id,
      codigoBarrasColumn: codigoBarras,
      linhaDigitavelColumn: linhaDigitavel,
      dataVencimentoColumn: dataVencimento,
      valorColumn: valor,
    };
    return map;
  }
}
