import 'dart:async';
import 'package:http/http.dart' show Client, Response;

import 'dart:convert';
import '../model/categories_item_model.dart';
import '../model/category_model.dart';
import '../model/item_model.dart';

class MealsApi {
  Client client = Client();

  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  /// Belirli bir yemek türündeki tüm yemekleri getirir.
  Future<ItemModel> fetchMeals(String type) async {
    Response response;
    response = await client.get(Uri.parse("$_baseUrl/filter.php?c=$type"));
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list meals');
    }
  }

  /// Belirli bir yemeğin detaylarını getirir.
  Future<ItemModel> fetchDetail(String id) async {
    Response response;
    response = await client.get(Uri.parse("$_baseUrl/lookup.php?i=$id"));
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail meals');
    }
  }

  /// Verilen bir isme göre yemek araması yapar.
  Future<ItemModel> searchMeals(String name) async {
    final response = await client.get(Uri.parse("$_baseUrl/search.php?s=$name"));
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load $name meals');
    }
  }

  /// Rastgele bir yemek getirir.
  Future<ItemModel> randomMeals() async {
    final response = await client.get(Uri.parse("$_baseUrl/random.php"));
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail meals');
    }
  }

  /// Kategorileri getirir.
  Future<CategoryModel> searchCategories() async {
    Response response;
    response = await client.get(Uri.parse("$_baseUrl/categories.php"));
    if (response.statusCode == 200) {
      return CategoryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load category of meals');
    }
  }

  /// Belirli bir kategoriye ait yemekleri getirir.
  Future<CategoryItemModel> fetchCategories(String category) async {
    Response response;
    response = await client.get(Uri.parse("$_baseUrl/filter.php?c=$category"));
    if (response.statusCode == 200) {
      return CategoryItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list of $category meals');
    }
  }
}
