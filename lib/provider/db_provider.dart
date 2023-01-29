import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:scannqr/models/scan_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BDProvider {
  static Database? _database;
  static final BDProvider bd = BDProvider._();
  BDProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initBD();
    return _database!;
  }

  Future<Database> initBD() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT)''');
    });
  }

  Future<int> nuevoScanraw(ScanModels nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    final db = await database;
    final res = await db.rawInsert('''INSERT INTO Scans (
      id,
      tipo,
      valor)
    VALUES (1, $tipo, $valor)
    ''');
    return res;
  }

  //OTRA OPCION MAS RAPIDA
  Future<int> anotherNuevoScanRaw(ScanModels nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    print(res);
    return res;
  }

  //OBTEBNER REGISTROS
  Future<ScanModels> getScansId(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    // ignore: null_check_always_fails
    return res.isNotEmpty ? ScanModels.fromJson(res.first) : null!;
  }

  //OBTENER TODOS LOS SCANS
  Future<List<ScanModels>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty
        ? res.map((s) => ScanModels.fromJson(s)).toList()
        : [];
  }

  //OBTENER LOS SCANS POR TIPOS
  Future<List<ScanModels>> getAllTypeScans(String tipo) async {
    final db = await database;
    final res =
        await db.rawQuery('''SELECT * FROM Scans WHERE tipo = '$tipo' ''');
    return res.isNotEmpty
        ? res.map((s) => ScanModels.fromJson(s)).toList()
        : [];
  }

  //ACTUALIZAR REGISTROS
  Future<int> updateScan(ScanModels nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  //BORRAR REGISTROS
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  //BORRAR TODOS LOS REGISTROS
  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.rawDelete('''DELETE FROM Scans''');
    return res;
  }
}
