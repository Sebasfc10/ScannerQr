import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scannqr/provider/scan_list_provider.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanList = Provider.of<ScanListProvider>(context, listen: false);
    final scans = scanList.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(color: Colors.red),
        onDismissed: (direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScansPorId(scans[index].id!);
        },
        key: UniqueKey(),
        child: ListTile(
          leading: Icon(Icons.map),
          title: Text(scans[index].valor),
          subtitle: Text(scans[index].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
      ),
    );
  }
}
