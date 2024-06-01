import 'package:flutter/foundation.dart';

class CategoryModel with ChangeNotifier {
  late List<Category> _categories; // Kategorileri içeren özel bir liste

  // JSON verisini kullanarak CategoryModel nesnesi oluşturan constructor.
  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      _categories = <Category>[];
      json['categories'].forEach(
        (v) {
          _categories.add(new Category.fromJson(v));
        },
      );
    }
  }

  // Kategorilerin kopyasını döndüren bir getter metodu.
  List<Category> get categories {
    return [..._categories];
  }
}

// Bu sınıf, bir kategoriyi temsil eder.
class Category {
  String? idCategory; // Kategori ID'si
  String? strCategory; // Kategori adı
  String? strCategoryThumb; // Kategori için küçük bir resim
  String? strCategoryDescription; // Kategoriye ait açıklama

  // JSON verisini kullanarak Category nesnesi oluşturan constructor.
  Category({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  Category.fromJson(Map<String, dynamic> json) {
    idCategory = json['idCategory'];
    strCategory = json['strCategory'];
    strCategoryThumb = json['strCategoryThumb'];
    strCategoryDescription = json['strCategoryDescription'];
  }
}
