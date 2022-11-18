import 'package:sqflite/sqflite.dart';
import 'package:tech_shop/datasource/local/data_base.dart';
import 'package:tech_shop/datasource/local/tb_pagamento_pix.dart';

class TbPagamentoPixHelper {
  // SELECT
  Future<List<TbPagamentoPix>> getPagamentoPix() async {
    Database db = await BancoDados().db;
    var response = await db.rawQuery(
      "SELECT * FROM ${TbPagamentoPix.nomeTabela} ",
    );
    print(response);
    if (response.isNotEmpty) {
      return response.map((c) => TbPagamentoPix.fromMap(c)).toList();
    } else {
      return [];
    }
  }

  // INSERT
  void insertPagamentoPix(
    String chave,
  ) async {
    Database db = await BancoDados().db;
    int response = await db.rawInsert(
      'INSERT INTO ${TbPagamentoPix.nomeTabela} (${TbPagamentoPix.chaveColumn}) VALUES ( ?)',
      [chave],
    );
    print(response);
  }

  // UPDATE
  void updatePagamentoPix(
    String chave,
  ) async {
    Database db = await BancoDados().db;
    await db.rawUpdate(
      "UPDATE ${TbPagamentoPix.nomeTabela} SET ${TbPagamentoPix.chaveColumn} = ?",
      [chave],
    );
  }

  // DELETE
  void deletePagamentoPix() async {
    Database db = await BancoDados().db;
    await db.rawDelete(
      "DELETE FROM ${TbPagamentoPix.nomeTabela}",
    );
  }
}
