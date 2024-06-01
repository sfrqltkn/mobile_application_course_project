import 'package:flutter/material.dart';

import '../resources/repository.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';
  final _repository = Repository();

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // Kategori öğelerini gösteren widget
      body: CategoryItem(repository: _repository),
    );
  }
}