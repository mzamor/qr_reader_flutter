import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
        onPressed: () async {
         // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#3D8BEF", "Cancel", false, ScanMode.QR);

          const barcodeScanRes = 'https://www.minutouno.com.ar';
          final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.newScan(barcodeScanRes);
          scanListProvider.newScan('geo:15.33,15.66');
      });
  }
}
