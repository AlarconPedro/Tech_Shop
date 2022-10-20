import 'package:sqflite/sqflite.dart';
import 'package:tech_shop/datasource/local/tb_usuario.dart';
import '../data_base.dart';

class TbUsuarioHelper {
  // SELECT
  Future<List<Map<String, Object?>>> getUsuario(int idUsuario) async {
    Database db = await BancoDados().db;
    var response = await db.rawQuery(
      "SELECT ${TbUsuario.usuarioColumn}, ${TbUsuario.senhaColumn} FROM ${TbUsuario.nomeTabela} "
      "WHERE ${TbUsuario.idColumn} = '$idUsuario'",
    );

    return response;
  }

  // INSERT
  void insertCodigoVenda(String usuario, String senha) async {
    Database db = await BancoDados().db;
    await db.rawQuery(
      'UPDATE ${TbUsuario.nomeTabela} SET ${TbUsuario.usuarioColumn} = ?, ${TbUsuario.senhaColumn} = ?',
      [usuario, senha],
    );
  }
  // UPDATE
  // DELETE
}
