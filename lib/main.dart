import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scannqr/pages/home_page.dart';
import 'package:scannqr/pages/map_page.dart';
import 'package:scannqr/pages/maps_pages.dart';
import 'package:scannqr/provider/scan_list_provider.dart';
import 'package:scannqr/provider/ui_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => new UiProvider()),
        ChangeNotifierProvider(create: (context) => new ScanListProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.teal,
            floatingActionButtonTheme: (FloatingActionButtonThemeData(
              backgroundColor: Colors.teal,
            ))),
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'maps': (_) => MapsPage(),
        },
      ),
    );
  }
}
