enum CategoryEnum {
  income,
  expense;
}

class CategoryModel {
  final String name;
  final bool isDeleted;
  final CategoryEnum type;

  CategoryModel(
      {required this.name, this.isDeleted = false, required this.type});
}
