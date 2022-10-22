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
  void insertCodigoVenda(String usuario, String senha) async {
    Database db = await BancoDados().db;
    await db.rawQuery(
      'UPDATE ${TbUsuario.nomeTabela} SET ${TbUsuario.usuarioColumn} = ?, ${TbUsuario.senhaColumn} = ? WHERE ${TbUsuario.idColumn} = ?',
      [usuario, senha, Globais.idCliente],
    );
  }

  void insertLogin(String usuario, String senha) async {
    Database db = await BancoDados().db;
    int id2 = await db.rawInsert(
      'INSERT INTO ${TbUsuario.nomeTabela} (${TbUsuario.usuarioColumn}, ${TbUsuario.senhaColumn}) VALUES (?, ?)',
      [usuario, senha],
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
  // DELETE
}
