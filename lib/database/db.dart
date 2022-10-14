import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DB {
  //criando banco de dados
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

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await DB.database();
    await db.insert(
      table,
      data,
    );
  }
}
