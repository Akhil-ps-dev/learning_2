import 'package:flutter/material.dart';
import 'package:sample_6/screens/home/widgets/bottom_nav.dart';

class Home extends StatelessWidget {
  const Home({super.key});
    static ValueNotifier<int> bottomnotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: SafeArea(child: Text('home')),
    );
  }
}
