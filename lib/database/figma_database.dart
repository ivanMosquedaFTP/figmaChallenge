import 'dart:async';
import 'dart:io';

import 'package:food_delivery/models/item_dao.dart';
import 'package:food_delivery/models/restaurant_dao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FigmaDatabase {
  static final namedb = "figmadb";
  static final versiondb = 1;

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    return _database = await _initDatabase();
  }

  Future<Database?> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathdb = join(directory.path, namedb);

    // database creation
    return openDatabase(pathdb, version: versiondb, onCreate: createTables);
  }

  FutureOr<void> createTables(Database db, int version) async {
    String restaurant =
        'CREATE TABLE restaurant(idRestaurant INTEGER PRIMARY KEY, deliveryFee integer, name varchar(50), description text, rating varchar(3), deliveryTime varchar(3))';

    String itemTable =
        'CREATE TABLE item(idItem INTEGER PRIMARY KEY, idRestaurant integer references restaurant(idRestaurant), cost integer, deliveryFee integer, name varchar(50), rating varchar(3), deliveryTime varchar(3), description text, availableSizes text, ingredients text)';

    await db.execute(restaurant);
    await db.execute(itemTable);
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    var con = await database;

    return con!.insert(table, data);
  }

  Future<int> updateRestaurant(String table, Map<String, dynamic> data) async {
    var con = await database;
    return con!.update(
      table,
      data,
      where: "idRestaurant = ?",
      whereArgs: [data['idRestaurant']],
    );
  }

  Future<int> updateItem(String table, Map<String, dynamic> data) async {
    var con = await database;
    return con!.update(
      table,
      data,
      where: "idItem = ?",
      whereArgs: [data['idItem']],
    );
  }

  Future<int> deleteRestaurant(String table, int idRestaurant) async {
    var con = await database;
    return con!.delete(
      table,
      where: "idRestaurant = ?",
      whereArgs: [idRestaurant],
    );
  }

  Future<int> deleteItem(String table, int idItem) async {
    var con = await database;
    return con!.delete(table, where: "idItem = ?", whereArgs: [idItem]);
  }

  Future<List<RestaurantDao>> selectRestaurant() async {
    var con = await database;

    // el atributo query de la conexion contiene la consulta select
    final res = await con!.query("restaurant");

    return res.map((restaurant) => RestaurantDao.fromMap(restaurant)).toList();
  }

  Future<List<ItemDao>> selectItem() async {
    var con = await database;

    // el atributo query de la conexion contiene la consulta select
    final res = await con!.query("item");

    return res.map((item) => ItemDao.fromMap(item)).toList();
  }
}
