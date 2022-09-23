import 'package:sample_6/models/category_model.dart';

abstract class CategoryDbFunctions {
  //TODO  List<CategoryModel>getAllCategories();
  Future<void> insertAllCategories(CategoryModel value);
}
