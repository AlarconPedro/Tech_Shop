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

  // INSERT
  void insertCarrinho(TbCarrinho carrinho) async {
    Database db = await BancoDados().db;
    int id2 = await db.rawInsert(
      'INSERT INTO ${TbCarrinho.nomeTabela} (${TbCarrinho.idProdutoColumn}, ${TbCarrinho.idColumn}, ${TbCarrinho.valorProdutoColumn}, ${TbCarrinho.valorTotalColumn}, ${TbCarrinho.qtdeProdutoColumn}) VALUES (?, ?, ?, ?, ?)',
      [
        carrinho.idProduto,
        carrinho.id,
        carrinho.valorProduto,
        carrinho.valorTotal,
        carrinho.qtdeProduto,
      ],
    );
    print(id2);
  }

  // UPDATE
  void updateCarrinho(TbCarrinho carrinho) async {
    Database db = await BancoDados().db;
    await db.rawUpdate(
      "UPDATE ${TbCarrinho.nomeTabela} SET ${TbCarrinho.idProdutoColumn} = ?, ${TbCarrinho.valorProdutoColumn} = ?, ${TbCarrinho.valorTotalColumn} = ?, ${TbCarrinho.qtdeProdutoColumn} = ? WHERE ${TbCarrinho.idColumn} = ?",
      [
        carrinho.idProduto,
        carrinho.valorProduto,
        carrinho.valorTotal,
        carrinho.qtdeProduto,
        Globais.idCliente,
      ],
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
