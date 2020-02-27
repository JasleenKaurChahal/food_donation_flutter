import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'ngo_model.dart';

class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String ADDRESS = 'address';
  static const String TABLE = 'NgoList';
  static const String DB_NAME = 'FoodDonationDB';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 3, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $NAME TEXT, $ADDRESS TEXT)");
  }

  Future<NgoListModel> save(NgoListModel ngoList) async {
    var dbClient = await db;
    print(' hello $ngoList');
    ngoList.id = await dbClient.insert(TABLE, ngoList.toMap());
    return ngoList;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }

  Future<List<NgoListModel>> getNgoList() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME, ADDRESS]);
    print(maps);
    // List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<NgoListModel> ngoList = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        ngoList.add(NgoListModel.fromMap(maps[i]));
      }
    }
    return ngoList;
  }

  Future<List<NgoListModel>> getFilteredList(String condition) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME, ADDRESS]);
    List<NgoListModel> ngoList = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        String a = maps[i][ADDRESS].toString();

        if ((a.toLowerCase()).contains((condition.toLowerCase())))
          ngoList.add(NgoListModel.fromMap(maps[i]));
      }
    }
    return ngoList;
  }
  // Future<int> delete(int id) async {
  //   var dbClient = await db;
  //   return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  // }

  // Future<int> update(NgoList ngoList) async {
  //   var dbClient = await db;
  //   return await dbClient.update(TABLE, ngoList.toMap(),
  //       where: '$ID = ?', whereArgs: [ngoList.id]);
  // }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
