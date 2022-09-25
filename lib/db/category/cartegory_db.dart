import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_6/models/category_model.dart';

const DB_Box_NAME = 'category_box';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getAllCategories();
  Future<void> insertAllCategories(CategoryModel value);
}

class CategoryDb implements CategoryDbFunctions {
  @override
  Future<void> insertAllCategories(CategoryModel value) async {
    final _categoryModelDB = await Hive.box<CategoryModel>(DB_Box_NAME);
    _categoryModelDB.add(value);
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final _categoryModelDB = await Hive.box<CategoryModel>(DB_Box_NAME);
    return _categoryModelDB.values.toList();
  }
}
