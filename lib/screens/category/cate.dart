import 'package:flutter/material.dart';
import 'package:sample_6/db/category/cartegory_db.dart';
import 'package:sample_6/screens/category/expense_cat_list.dart';
import 'package:sample_6/screens/category/income_cat_list.dart';

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
    CategoryDb().refreshUi();
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
              Income(),
              Expense(),
            ],
          ),
        )
      ],
    );
  }
}
