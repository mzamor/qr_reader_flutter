import 'package:flutter/material.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 10,
        itemBuilder: (_, index) => ListTile(
          leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
          title: const Text('http://www.terra.com.ar'),
          subtitle: const Text('ID: 1'),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
          onTap: () => debugPrint('open something...'),
        ),);
  }
}
