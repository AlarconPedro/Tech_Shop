import 'package:flutter/material.dart';
import 'package:tech_shop/classes/classes.dart';

class TbUsuario {
  static const String nomeTabela = 'TbUsuario';
  static const String idColumn = 'id';
  static const String usuarioColumn = 'usuario';
  static const String senhaColumn = 'senha';
  static const String nomeColumn = 'nome';

  static const String scriptCreateTable = '''
    CREATE TABLE $nomeTabela (
      $idColumn INTEGER PRIMARY KEY,
      $usuarioColumn TEXT,
      $senhaColumn TEXT,
      $nomeColumn TEXT
    )
  ''';

  int id = 0;
  String usuario = '';
  String senha = '';
  String nome = '';

  TbUsuario();

  TbUsuario.fromMap(Map map) {
    id = map[idColumn];
    usuario = map[usuarioColumn];
    senha = map[senhaColumn];
    nome = map[nomeColumn] ?? Globais.nomeCliente;
  }

  Map toMap() {
    Map<String, dynamic> map = {
      idColumn: id,
      usuarioColumn: usuario,
      senhaColumn: senha,
      nomeColumn: nome,
    };
    return map;
  }
}
