import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return  ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
        title: Text(scans[index].value),
        subtitle: Text(scans[index].id.toString()),
        trailing: const Icon(Icons.home_max_outlined, color: Colors.grey,),
        onTap: () => debugPrint(scans[index].id.toString()),
      ),);
  }
}
