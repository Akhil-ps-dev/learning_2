import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_6/models/category_model.dart';

const DB_Box_NAME = 'category_box';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getAllCategories();
  Future<void> insertAllCategories(CategoryModel value);
}

class CategoryDb implements CategoryDbFunctions {
  ValueNotifier<List<CategoryModel>> incomeNotifier = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseNotifier = ValueNotifier([]);

  @override
  Future<void> insertAllCategories(CategoryModel value) async {
    final _categoryModelDB = await Hive.box<CategoryModel>(DB_Box_NAME);
    _categoryModelDB.add(value);
    refreshUi();
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final _categoryModelDB = await Hive.box<CategoryModel>(DB_Box_NAME);
    return _categoryModelDB.values.toList();
  }

  Future<void> refreshUi() async {
    final _allCategory = await getAllCategories();
    incomeNotifier.value.clear();
    expenseNotifier.value.clear();

    await Future.forEach(_allCategory, (CategoryModel category) {
      if (category.type == CategoryEnum.income) {
        incomeNotifier.value.add(category);
      } else {
        expenseNotifier.value.add(category);
      }
    });
    incomeNotifier.notifyListeners();
    expenseNotifier.notifyListeners();
  }
}
