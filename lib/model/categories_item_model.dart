class CategoryItemModel {
  List<CategoriesItem>? categoriesItem;

  CategoryItemModel({this.categoriesItem});

  // JSON verisini CategoryItemModel nesnesine dönüştüren constructor.
  CategoryItemModel.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      categoriesItem = <CategoriesItem>[];
      json['meals'].forEach((v) {
        categoriesItem!.add(new CategoriesItem.fromJson(v));
      });
    }
  }
}

class CategoriesItem {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  CategoriesItem({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  // JSON verisini CategoriesItem nesnesine dönüştüren constructor.
  CategoriesItem.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }
}
