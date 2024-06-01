import 'dart:async';

import 'package:mobil_application_course_project/model/category_model.dart';

import '../model/categories_item_model.dart';
import '../model/item_model.dart';
import 'meals_api.dart';

class Repository {
  final mealsApi = MealsApi();

  /// Belirli bir yemek türündeki tüm yemekleri getirir.
  Future<ItemModel> fetchAllMeals(String type) async =>
      mealsApi.fetchMeals(type);

  /// Belirli bir yemeğin detaylarını getirir.
  Future<ItemModel> fetchDetailMeals(int id) async =>
      mealsApi.fetchDetail(id.toString());

  /// Verilen bir isme göre yemek araması yapar.
  Future<ItemModel> searchMeals(String name) async =>
      mealsApi.searchMeals(name);

  /// Rastgele bir yemek getirir.
  Future<ItemModel> randomMeals() async => mealsApi.randomMeals();

  /// Kategorileri getirir.
  Future<CategoryModel> searchCategories() async =>
      mealsApi.searchCategories();

  /// Belirli bir kategoriye ait yemekleri getirir.
  Future<CategoryItemModel> fetchCategories(String category) async =>
      mealsApi.fetchCategories(category);
}
