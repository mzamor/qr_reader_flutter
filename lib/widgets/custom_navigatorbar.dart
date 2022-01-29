import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (value) => uiProvider.selectedMenuOpt = value,
      currentIndex: currentIndex,
      elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Maps'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration),
              label: 'Direcciones',
          ),
        ]);
  }
}
