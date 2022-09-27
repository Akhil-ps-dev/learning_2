import 'package:flutter/material.dart';
import 'package:sample_6/db/category/cartegory_db.dart';

import '../../models/category_model.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: CategoryDb().incomeNotifier,
        builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _) {
          return ListView.separated(
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: ((ctx, index) {
                final category = newlist[index];
                return ListTile(
                  title: Text(category.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                );
              }),
              itemCount: newlist.length);
        },
      ),
    );
  }
}
