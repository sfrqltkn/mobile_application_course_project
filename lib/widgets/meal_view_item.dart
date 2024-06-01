import 'package:flutter/material.dart';
import '../model/item_model.dart';
import '../resources/repository.dart';

class MealView extends StatelessWidget {
  const MealView({super.key, required this.repository, required this.title});

  final Repository repository; // Veri kaynağı
  final String title; 

  Widget _buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDescription(String? description) {
    return Text(
      description ?? "", // Eğer açıklama yoksa boş bir string göster
      style: const TextStyle(
        fontSize: 16,
      ),
      textAlign: TextAlign.justify, // Açıklamayı tam olarak hizalamak için
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<ItemModel>(
        future: repository.searchMeals(title), // Belirli bir yemeği arama
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Veri geldiyse, listeyi al
            List<Meals>? newItem = snapshot.data!.meals;
            return ListView(
              padding: const EdgeInsets.all(14.0),
              children: [
                // Yemeğin resmini gösteren widget
                Container(
                  child: Image.network('${newItem![0].strMealThumb}'),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                // Yemeğin adını gösteren widget
                Text(
                  '${newItem[0].strMeal}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // Kategori bilgisini gösteren satır
                Row(
                  children: [
                    _buildSubtitle('Category: '),
                    _buildDescription(newItem[0].strCategory),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // Yer bilgisini gösteren satır
                Row(
                  children: [
                    _buildSubtitle('Place: '),
                    _buildDescription(newItem[0].strArea),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                _buildSubtitle('Description:'),
                const SizedBox(
                  height: 8.0,
                ),
                _buildDescription(newItem[0].strInstructions),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // Veriler yüklenirken gösterilen yükleme göstergesi
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
