import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scannqr/models/scan_models.dart';
import 'package:scannqr/pages/direcciones_pages.dart';
import 'package:scannqr/pages/map_page.dart';
import 'package:scannqr/provider/db_provider.dart';
import 'package:scannqr/provider/scan_list_provider.dart';
import 'package:scannqr/provider/ui_provider.dart';
import 'package:scannqr/widgets/scan_button.dart';

import '../widgets/custom_navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              },
              icon: Icon(Icons.delete_forever)),
        ],
        elevation: 0,
      ),
      body: const _HomePagesBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: FloatingButtonScan(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePagesBody extends StatelessWidget {
  const _HomePagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    //final bdProvider = Provider.of<BDProvider>(context);

    //final initem = BDProvider.bd.getAllScans();

    //BDProvider.bd.anotherNuevoScanRaw(temScans);
    //print(initem);

    final scanList = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanList.cargarScansPorTipo('geo');
        return const MapPage();

      case 1:
        scanList.cargarScansPorTipo('http');
        return const Direccionespges();

      default:
        return MapPage();
    }
  }
}
