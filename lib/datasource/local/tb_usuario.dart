import 'package:flutter/material.dart';

class TbUsuario {
  static const String nomeTabela = 'TbUsuario';
  static const String idColumn = 'id';
  static const String usuarioColumn = 'usuario';
  static const String senhaColumn = 'senha';
  static const String nomeColumn = 'nome';

  static const String scriptCreateTable = '''
    CREATE TABLE $nomeTabela (
      $idColumn INTEGER PRIMARY KEY,
      $usuarioColumn TEXT NOT NULL,
      $senhaColumn TEXT NOT NULL,
      $nomeColumn TEXT NOT NULL
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
    nome = map[nomeColumn];
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
