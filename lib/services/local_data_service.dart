import 'dart:io';

import 'package:ads_tv_flutter/models/local_data_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDbVideoService {
  Database? db;

  LocalDbVideoService._();
  static LocalDbVideoService? _instance;

  static LocalDbVideoService get instance {
    _instance ??= LocalDbVideoService._();
    return _instance!;
  }

  Future<void> open() async {
    if (db != null) {
      print("Databases Opened");

      return;
    }
    print("Opening Databases");
    var databasesPath = await getDatabasesPath();
    try {
      await Directory(databasesPath).create(recursive: true);
      var path = "$databasesPath/my_video.db";
      print("db Path $path");
      db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute('''
  create table $tableFile ( 
    $columnId integer primary key autoincrement, 
    $columnTitle text not null,
    $columnTime integer not null,
    $columnFilePath text not null
    );
''');
      });
    } catch (_) {
      print("_");
    }
  }

  Future<List<LocalDbVideoModel>> getAllFile() async {
    List<LocalDbVideoModel> videos = [];
    if (db == null) {
      return videos;
    }
    List<Map<String, dynamic>> maps = await db!.query(
      tableFile,
      columns: [columnId, columnTitle, columnTime, columnFilePath],
    );

    for (var element in maps) {
      print(element);
      videos.add(LocalDbVideoModel.fromMap(element));
    }
    return videos;
  }

  Future<LocalDbVideoModel?> insert(LocalDbVideoModel todo) async {
    if (db == null) return null;

    var id = await db!.insert(tableFile, todo.toMap());
    todo = todo.copyWith(id: id);
    return todo;
  }

  Future<LocalDbVideoModel?> getVideo(int id) async {
    if (db == null) return null;
    List<Map<String, dynamic>> maps = await db!.query(tableFile,
        columns: [columnId, columnTitle, columnTime, columnFilePath],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return LocalDbVideoModel.fromMap(maps.first);
    }
    return null;
  }

  Future<bool> exists(String fileLink) async {
    if (db == null) return false;
    List<Map<String, dynamic>> maps = await db!.query(tableFile,
        columns: [columnId, columnTitle, columnTime, columnFilePath],
        where: '$fileLink = ?',
        whereArgs: [fileLink]);
    if (maps.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<int?> delete(int id) async {
    if (db == null) return null;

    return await db!.delete(tableFile, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int?> update(LocalDbVideoModel todo) async {
    if (db == null) return null;
    return await db!.update(tableFile, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db?.close();
}
