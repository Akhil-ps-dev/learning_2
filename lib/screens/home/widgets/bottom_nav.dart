import 'package:flutter/material.dart';

import '../home.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Home.bottomnotifier,
      builder: ((BuildContext context, int updatedIndex, _) {
        return BottomNavigationBar(
          currentIndex: updatedIndex,
          onTap: (newIndex) {
            Home.bottomnotifier.value = newIndex;
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.flutter_dash), label: 'Transaction'),
            BottomNavigationBarItem(
                icon: Icon(Icons.flash_on_outlined), label: 'Category'),
          ],
        );
      }),
    );
  }
}
