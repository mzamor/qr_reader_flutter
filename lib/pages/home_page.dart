import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/pages/map_page.dart';
import 'package:qr_scanner_app/providers/db_provider.dart';
import 'package:qr_scanner_app/providers/ui_provider.dart';
import 'package:qr_scanner_app/widgets/custom_navigatorbar.dart';
import 'package:qr_scanner_app/widgets/scan_button.dart';

import 'addresses_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: const HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    DBProvider.db.deleteAllScans();

    switch (currentIndex) {
      case 0:
        return const MapsPage();

      case 1:
        return const AddressesPage();

      default:
        return const MapsPage();
    }
  }
}
