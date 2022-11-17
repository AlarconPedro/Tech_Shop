import 'package:sqflite/sqflite.dart';
import 'package:tech_shop/datasource/local/tb_pagamento_boleto.dart';
import 'package:tech_shop/datasource/local/tb_pagamento_cartao.dart';
import 'package:tech_shop/datasource/local/tb_pagamento_pix.dart';
import 'package:tech_shop/datasource/local/tb_usuario.dart';
import 'dart:async';
import 'package:path/path.dart';

class BancoDados {
  final String nomeBanco = "techshop.db";

  static final BancoDados _instance = BancoDados.internal();
  factory BancoDados() => _instance;
  BancoDados.internal();

  Database? _db;

  Future<Database> get db async {
    _db ??= await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    final path = await getDatabasesPath();
    final caminhoBanco = join(path, nomeBanco);

    return await openDatabase(caminhoBanco, version: 1,
        onCreate: (Database db, int newVersion) async {
      await _executarComando(db, TbUsuario.scriptCreateTable);
      await _executarComando(db, TbPagamentoCartao.scriptCreateTable);
      await _executarComando(db, TbPagamentoBoleto.scriptCreateTable);
      await _executarComando(db, TbPagamentoPix.scriptCreateTable);
    });
  }

  Future<void> _executarComando(Database db, String sSQL) async {
    try {
      await db.execute(sSQL);
    } on Exception catch (_) {}
  }
}
