import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/utils/utils.dart';
import '../providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  final String type;

  ScanTiles({required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return  ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direction) => Provider.of<ScanListProvider>(context, listen: false).deleteScansById(scans[index].id!),
        child: ListTile(
          leading: Icon(
            type=='http'
                ? Icons.home_outlined
                :Icons.map,
            color: Theme.of(context).primaryColor,),
          title: Text(scans[index].value),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
          onTap: () => launchURL(context, scans[index]),
        ),
      ),);
  }
}
