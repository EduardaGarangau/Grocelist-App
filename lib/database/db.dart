import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DB {
  //Criando banco de dados
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'items.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE items (id INTEGER PRIMARY KEY, name TEXT, checked INT)');
      },
      version: 1,
    );
  }

  //Método para adicionar item no banco de dados
  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await DB.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  //Método para recuperar os itens no banco de dados
  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DB.database();
    return db.query(table);
  }

  //Método para excluir item no banco de dados
  static Future<void> delete(String table, int id) async {
    final db = await DB.database();
    await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Método para mudar o valor do checkbox no banco de dados
  static Future<void> setChecked(String table, int id, bool check) async {
    final db = await DB.database();

    //Fazendo atualização no atributo checked no banco de dados
    Map<String, dynamic> checked = {
      'checked': check ? 1 : 0,
    };

    await db.update(
      table,
      checked,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Método para excluir todos os itens no banco de dados
  static Future<void> deleteAll(String table) async {
    final db = await DB.database();

    await db.rawQuery('delete from $table');
  }
}
