import 'package:flutter/material.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontoller;
  @override
  void initState() {
    _tabcontoller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabcontoller,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              text: 'Expense',
            ),
            Tab(
              text: 'Income',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabcontoller,
            children: [
              Text('Expense'),
              Text('Income'),
            ],
          ),
        )
      ],
    );
  }
}
