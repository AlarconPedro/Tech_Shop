import 'package:sqflite/sqflite.dart';
import 'package:tech_shop/classes/classes.dart';

import '../data_base.dart';
import '../tb_carrinho.dart';

class TbCarrinhoHelper {
  // SELECT
  Future<List<TbCarrinho>> getCarrinho() async {
    Database db = await BancoDados().db;
    var response = await db.rawQuery(
      "SELECT * FROM ${TbCarrinho.nomeTabela} ",
    );
    print(response);
    List<TbCarrinho> list = response.isNotEmpty
        ? response.map((c) => TbCarrinho.fromMap(c)).toList()
        : [];
    return list;
  }

  Future<int> getQtdeCarrinho(int idProduto) async {
    Database db = await BancoDados().db;
    var response = await db.rawQuery(
      "SELECT SUM(${TbCarrinho.qtdeProdutoColumn}) FROM ${TbCarrinho.nomeTabela} WHERE ${TbCarrinho.idProdutoColumn} = ?",
      [idProduto],
    );
    print(response);
    return Sqflite.firstIntValue(response)!;
  }

  // INSERT
  void insertCarrinho(
    int idProduto,
    int idVenda,
    double valorProduto,
    double valorTotal,
    int qtdeProduto,
  ) async {
    Database db = await BancoDados().db;
    int id2 = await db.rawInsert(
      'INSERT INTO ${TbCarrinho.nomeTabela} (${TbCarrinho.idProdutoColumn}, ${TbCarrinho.idColumn}, ${TbCarrinho.valorProdutoColumn}, ${TbCarrinho.valorTotalColumn}, ${TbCarrinho.qtdeProdutoColumn}) VALUES (?, ?, ?, ?, ?)',
      [
        idProduto,
        idVenda,
        valorProduto,
        valorTotal,
        qtdeProduto,
      ],
    );
  }

  // UPDATE
  void updateCarrinho(int idProduto, double valorProduto, double valorTotal,
      int qtdeProduto) async {
    Database db = await BancoDados().db;
    await db.rawUpdate(
      "UPDATE ${TbCarrinho.nomeTabela} SET ${TbCarrinho.idProdutoColumn} = ?, ${TbCarrinho.valorProdutoColumn} = ?, ${TbCarrinho.valorTotalColumn} = ?, ${TbCarrinho.qtdeProdutoColumn} = ? WHERE ${TbCarrinho.idColumn} = ?",
      [
        idProduto,
        valorProduto,
        valorTotal,
        qtdeProduto,
        Globais.idCliente,
      ],
    );
  }

  void updateQuantidadeMais() async {
    Database db = await BancoDados().db;
    await db.rawUpdate(
      "UPDATE ${TbCarrinho.nomeTabela} SET ${TbCarrinho.qtdeProdutoColumn} = ${TbCarrinho.qtdeProdutoColumn} + 1 WHERE ${TbCarrinho.idColumn} = ?",
      [Globais.idCliente],
    );
  }

  void updateQuantidadeMenos() async {
    Database db = await BancoDados().db;
    await db.rawUpdate(
      "UPDATE ${TbCarrinho.nomeTabela} SET ${TbCarrinho.qtdeProdutoColumn} = ${TbCarrinho.qtdeProdutoColumn} - 1 WHERE ${TbCarrinho.idColumn} = ?",
      [Globais.idCliente],
    );
  }

  // DELET
  void deleteCarrinho(int id) async {
    Database db = await BancoDados().db;
    await db.rawDelete(
      "DELETE FROM ${TbCarrinho.nomeTabela} WHERE ${TbCarrinho.idColumn} = ?",
      [id],
    );
  }
}
