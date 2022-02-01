import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/pages/home_page.dart';
import 'package:qr_scanner_app/pages/map_page.dart';
import 'package:qr_scanner_app/providers/scan_list_provider.dart';
import 'package:qr_scanner_app/providers/ui_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()
    )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'maps':  (_) => const MapsPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.purple,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.purple,
          )
        ),
        ),
    );

  }
}