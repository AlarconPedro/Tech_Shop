import 'package:sqflite/sqflite.dart';
import 'package:tech_shop/classes/classes.dart';
import 'package:tech_shop/datasource/local/tb_usuario.dart';
import '../data_base.dart';

class TbUsuarioHelper {
  // SELECT
  Future<TbUsuario> getUsuario() async {
    Database db = await BancoDados().db;
    var response = await db.rawQuery(
      "SELECT * FROM ${TbUsuario.nomeTabela} ",
    );
    print(response);
    if (response.isNotEmpty) {
      return TbUsuario.fromMap(response.first);
    } else {
      return TbUsuario();
    }
  }

  // INSERT
  void insertCodigoVenda(int codigoVenda) async {
    Database db = await BancoDados().db;
    await db.rawQuery(
      'UPDATE ${TbUsuario.nomeTabela} SET ${TbUsuario.idVendaColumn} = ?',
      [codigoVenda],
    );
  }

  void insertLogin(String usuario, String senha) async {
    Database db = await BancoDados().db;
    int id2 = await db.rawInsert(
      'INSERT INTO ${TbUsuario.nomeTabela} (${TbUsuario.usuarioColumn}, ${TbUsuario.senhaColumn}, ${TbUsuario.idVendaColumn}, ${TbUsuario.nomeColumn}) VALUES (?, ?, ?, ?)',
      [usuario, senha, 0, Globais.nomeCliente ?? ""],
    );
    print(id2);
  }

  // UPDATE
  void updateUsuario(String usuario, String senha) async {
    Database db = await BancoDados().db;
    await db.rawUpdate(
      "UPDATE ${TbUsuario.nomeTabela} SET ${TbUsuario.usuarioColumn} = ?, ${TbUsuario.senhaColumn} = ?",
      [usuario, senha],
    );
  }

  void updateIdVenda(int idVenda) async {
    Database db = await BancoDados().db;
    await db.rawUpdate(
      "UPDATE ${TbUsuario.nomeTabela} SET ${TbUsuario.idVendaColumn} = ?",
      [idVenda],
    );
  }

  // DELETE
  void deleteUsuario() async {
    Database db = await BancoDados().db;
    await db.rawDelete(
      "DELETE FROM ${TbUsuario.nomeTabela}",
    );
  }
}
