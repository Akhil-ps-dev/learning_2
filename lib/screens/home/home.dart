import 'package:flutter/material.dart';
import 'package:sample_6/screens/category/cate.dart';
import 'package:sample_6/screens/home/widgets/bottom_nav.dart';
import 'package:sample_6/screens/transaction/trans.dart';

class Home extends StatelessWidget {
  Home({super.key});
  static ValueNotifier<int> bottomnotifier = ValueNotifier(0);
  final _pages = [
    ScreenTrans(),
    ScreenCategory(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: bottomnotifier,
              builder: (BuildContext ctx, int updatedindex, Widget? _) {
                return _pages[updatedindex];
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (bottomnotifier.value == 0) {
            print('trans');
          } else {
            print('cate');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
