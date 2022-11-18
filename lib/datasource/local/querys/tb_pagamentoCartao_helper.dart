import 'package:sqflite/sqflite.dart';
import 'package:tech_shop/datasource/local/data_base.dart';
import 'package:tech_shop/datasource/local/tb_pagamento_cartao.dart';

class TbPagamentoCartaoHelper {
  // Select
  Future<List<TbPagamentoCartao>> getCartoesPagamento() async {
    Database db = await BancoDados().db;
    var response = await db.rawQuery(
      "SELECT * FROM ${TbPagamentoCartao.nomeTabela} ",
    );
    print(response);
    if (response.isNotEmpty) {
      return response.map((c) => TbPagamentoCartao.fromMap(c)).toList();
    } else {
      return [];
    }
  }

  // Insert
  void insertPagamentoCartao(
    String nomeTitular,
    String numeroCartao,
    String cvv,
    String validadeCartao,
  ) async {
    Database db = await BancoDados().db;
    int response = await db.rawInsert(
      'INSERT INTO ${TbPagamentoCartao.nomeTabela} (${TbPagamentoCartao.nomeTitularColumn}, ${TbPagamentoCartao.numeroColumn}, ${TbPagamentoCartao.cvvColumn}, ${TbPagamentoCartao.validadeColumn}) VALUES ( ?, ?, ?, ?)',
      [nomeTitular, numeroCartao, cvv, validadeCartao],
    );
    print(response);
  }

  // Update
  void updatePagamentoCartao(
    String nomeTitular,
    String numeroCartao,
    String cvv,
    String validadeCartao,
  ) async {
    Database db = await BancoDados().db;
    await db.rawUpdate(
      "UPDATE ${TbPagamentoCartao.nomeTabela} SET ${TbPagamentoCartao.nomeTitularColumn} = ?, ${TbPagamentoCartao.numeroColumn} = ?, ${TbPagamentoCartao.cvvColumn} = ?, ${TbPagamentoCartao.validadeColumn} = ?",
      [nomeTitular, numeroCartao, cvv, validadeCartao],
    );
  }

  // Delete
  void deletePagamentoCartao(String numeroCartao) async {
    Database db = await BancoDados().db;
    await db.rawDelete(
      "DELETE FROM ${TbPagamentoCartao.nomeTabela} WHERE ${TbPagamentoCartao.numeroColumn} = ?",
      [numeroCartao],
    );
  }
}
