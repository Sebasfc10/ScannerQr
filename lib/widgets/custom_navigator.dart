import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scannqr/provider/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context, listen: false);

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      // ignore: prefer_const_literals_to_create_immutables
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Direcciones',
        )
      ],
      elevation: 0,
      currentIndex: uiProvider.selectedMenuOpt,
    );
  }
}
