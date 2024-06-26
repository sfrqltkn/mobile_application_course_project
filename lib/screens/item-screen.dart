import 'package:flutter/material.dart';

import '../widgets/meal_view_item.dart';
import '../widgets/app_bar_result.dart';
import '../resources/repository.dart';

class ItemScreen extends StatelessWidget {
  static const routeName = '/item-detail';

  final _repository = Repository();

  ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: resultAppBar(context),
      // Yemek detaylarının görüntülendiği MealView widget'ı
      body: MealView(
        repository: _repository,
        title: title,
      ),
    );
  }
}
