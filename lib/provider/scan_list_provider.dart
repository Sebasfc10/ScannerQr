import 'package:flutter/material.dart';
import 'package:scannqr/models/scan_models.dart';
import 'package:scannqr/provider/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModels> scans = [];
  String tipoSelecionado = 'http';

  nuevoScan(String valor) async {
    final nuevoscan = new ScanModels(valor: valor);
    final id = await BDProvider.bd.anotherNuevoScanRaw(nuevoscan);
    nuevoscan.id = id;

    if (this.tipoSelecionado == nuevoscan.tipo) {
      this.scans.add(nuevoscan);
      notifyListeners();
    }
  }

  cargarScans() async {
    final scans = await BDProvider.bd.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await BDProvider.bd.getAllTypeScans(tipo);
    this.scans = [...scans];
    tipoSelecionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await BDProvider.bd.deleteAllScans();
    notifyListeners();
  }

  borrarScansPorId(int id) async {
    await BDProvider.bd.deleteScan(id);
    notifyListeners();
  }
}
