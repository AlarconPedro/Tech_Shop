import 'package:tech_shop/classes/classes.dart';

class TbPagamento {
  static const String nomeTabela = 'TbPagamento';
  static const String idColumn = 'id';
  static const String bandeiraColumn = 'bandeira';
  static const String numeroColumn = 'numero';
  static const String validadeColumn = 'validade';
  static const String cvvColumn = 'cvv';
  static const String cpfColumn = 'cpf';
  static const String nomeTitularColumn = 'nomeTitular';

  static const String scriptCreateTable = '''
    CREATE TABLE $nomeTabela (
      $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
      $bandeiraColumn TEXT,
      $numeroColumn TEXT,
      $validadeColumn TEXT,
      $cvvColumn TEXT,
      $cpfColumn TEXT,
      $nomeTitularColumn TEXT
    )
  ''';

  int id = 0;
  String bandeira = '';
  String numero = '';
  String validade = '';
  String cvv = '';
  String cpf = '';
  String nomeTitular = '';

  TbPagamento();

  TbPagamento.fromMap(Map map) {
    id = map[idColumn];
    bandeira = map[bandeiraColumn];
    numero = map[numeroColumn];
    validade = map[validadeColumn];
    cvv = map[cvvColumn];
    cpf = map[cpfColumn];
    nomeTitular = map[nomeTitularColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      idColumn: id,
      bandeiraColumn: bandeira,
      numeroColumn: numero,
      validadeColumn: validade,
      cvvColumn: cvv,
      cpfColumn: cpf,
      nomeTitularColumn: nomeTitular,
    };
    return map;
  }
}
