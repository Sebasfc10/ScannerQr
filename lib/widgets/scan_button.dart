import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:scannqr/provider/scan_list_provider.dart';

class FloatingButtonScan extends StatelessWidget {
  const FloatingButtonScan({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'CANCEL_BUTTON_TEXT', false, ScanMode.QR);

        print(barcodeScanRes);
        final scanList = Provider.of<ScanListProvider>(context, listen: false);
        scanList.nuevoScan(barcodeScanRes);
        //scanList.nuevoScan('geo:15.33,15.66');
      },
      elevation: 0,
    );
  }
}
