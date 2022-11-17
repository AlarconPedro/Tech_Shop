class TbPagamentoPix {
  static const String nomeTabela = 'TbPagamentoPix';
  static const String idColumn = 'id';
  static const String chaveColumn = 'chave';

  static const String scriptCreateTable = '''
    CREATE TABLE $nomeTabela (
      $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
      $chaveColumn TEXT
    )
  ''';

  int id = 0;
  String chave = '';

  TbPagamentoPix();

  TbPagamentoPix.fromMap(Map map) {
    id = map[idColumn];
    chave = map[chaveColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      idColumn: id,
      chaveColumn: chave,
    };
    return map;
  }
}
