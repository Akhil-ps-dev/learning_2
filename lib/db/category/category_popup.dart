import 'package:flutter/material.dart';
import 'package:sample_6/db/category/cartegory_db.dart';

import 'package:sample_6/models/category_model.dart';
import 'package:sample_6/screens/category/income_cat_list.dart';

ValueNotifier<CategoryEnum> selectedCategoryNotifier =
    ValueNotifier(CategoryEnum.income);

Future<void> showPopUp(BuildContext ctx) async {
  final _nameEditingController = TextEditingController();

  return showDialog(
    context: ctx,
    builder: (ctx1) {
      return SimpleDialog(
        title: Text('Add Datas'),
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                RadioBtn(type: CategoryEnum.income, title: 'Income'),
                RadioBtn(type: CategoryEnum.expense, title: 'Expense'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final _name = _nameEditingController.text;
              if (_name.isEmpty) {
                return;
              }
              final _type = selectedCategoryNotifier.value;

              final _category = CategoryModel(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                name: _name,
                type: _type,
              );
              CategoryDb().insertAllCategories(_category);
              Navigator.of(ctx1).pop();
            },
            child: Text(
              'add',
            ),
          )
        ],
      );
    },
  );
}

class RadioBtn extends StatelessWidget {
  final CategoryEnum type;
  final String title;

  const RadioBtn({
    Key? key,
    required this.type,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedCategoryNotifier,
            builder:
                (BuildContext context, CategoryEnum newCategory, Widget? _) {
              return Radio<CategoryEnum>(
                  value: type,
                  groupValue: newCategory,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    selectedCategoryNotifier.value = value;
                    selectedCategoryNotifier.notifyListeners();
                  });
            }),
        Text(title)
      ],
    );
  }
}
