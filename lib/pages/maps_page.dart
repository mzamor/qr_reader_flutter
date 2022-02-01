import 'package:flutter/material.dart';
import '../widgets/scan_tiles.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(type: 'geo');
  }
}
