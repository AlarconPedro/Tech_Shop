import 'package:sqflite/sqflite.dart';
import 'package:tech_shop/datasource/local/data_base.dart';
import 'package:tech_shop/datasource/local/tb_pagamento_boleto.dart';

class TbPagamentoBoletoHelper {
  // SELECT
  Future<TbPagamentoBoleto> getPagamento() async {
    Database db = await BancoDados().db;
    var response = await db.rawQuery(
      "SELECT * FROM ${TbPagamentoBoleto.nomeTabela} ",
    );
    // print(response);
    if (response.isNotEmpty) {
      return TbPagamentoBoleto.fromMap(response.first);
    } else {
      return TbPagamentoBoleto();
    }
  }

  // INSERT
  void insertPagamentoBoleto(
    String codigoBarras,
    String linhaDigitavel,
    String dataVencimento,
    String id,
    String valor,
  ) async {
    Database db = await BancoDados().db;
    int response = await db.rawInsert(
      'INSERT INTO ${TbPagamentoBoleto.nomeTabela} (${TbPagamentoBoleto.codigoBarrasColumn}, ${TbPagamentoBoleto.linhaDigitavelColumn}, ${TbPagamentoBoleto.dataVencimentoColumn}, ${TbPagamentoBoleto.idColumn}, ${TbPagamentoBoleto.valorColumn}) VALUES ( ?, ?, ?, ?, ?)',
      [codigoBarras, linhaDigitavel, dataVencimento, id, valor],
    );
    // print(response);
  }

  // UPDATE
  void updatePagamentoBoleto(
    String codigoBarras,
    String linhaDigitavel,
    String dataVencimento,
    String id,
    String valor,
  ) async {
    Database db = await BancoDados().db;
    await db.rawUpdate(
      "UPDATE ${TbPagamentoBoleto.nomeTabela} SET ${TbPagamentoBoleto.codigoBarrasColumn} = ?, ${TbPagamentoBoleto.linhaDigitavelColumn} = ?, ${TbPagamentoBoleto.dataVencimentoColumn} = ?, ${TbPagamentoBoleto.idColumn} = ?, ${TbPagamentoBoleto.valorColumn} = ?",
      [codigoBarras, linhaDigitavel, dataVencimento, id, valor],
    );
  }

  // DELETE
  void deletePagamentoBoleto() async {
    Database db = await BancoDados().db;
    await db.rawDelete(
      "DELETE FROM ${TbPagamentoBoleto.nomeTabela}",
    );
  }
}
