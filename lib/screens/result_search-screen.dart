import 'package:flutter/material.dart';

import '../resources/repository.dart';
import '../model/categories_item_model.dart';
import '../widgets/app_bar_result.dart';
import '../widgets/result_subtitle.dart';
import '../widgets/card_meal_result.dart';

class ResultSearchScreen extends StatelessWidget {
  static const routeName = 'result-search';

  final _repository = Repository(); 

  ResultSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Argüman olarak alınan kategori adını alma
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return Center(
      child: FutureBuilder<CategoryItemModel>(
        // Kategoriye göre yemekleri getiren future
        future: _repository.fetchCategories(category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Veri geldiyse, kategoriye ait yemekleri al
            List<CategoriesItem>? categories = snapshot.data!.categoriesItem;
            int length = categories!.length;
            return Scaffold(
              appBar: resultAppBar(context),
              body: ListView(
                children: [
                  ResultSubtitle(
                    category: category,
                    lenght: length,
                  ),
                  // Kategoriye ait her bir yemeği gösteren widget'lar
                  for (int i = 0; i < length; i++)
                    CardMealResult(
                      repository: _repository,
                      title: categories[i].strMeal!,
                    ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            // Hata durumunda hata mesajını gösterme
            return Text('${snapshot.error}');
          }
          // Veriler yüklenirken gösterilen yükleme göstergesi
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
