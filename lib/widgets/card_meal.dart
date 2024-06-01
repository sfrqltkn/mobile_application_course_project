import 'package:flutter/material.dart';
import '../model/item_model.dart';
import '../resources/repository.dart';
import '../screens/item-screen.dart';

class CardMeal extends StatelessWidget {
  const CardMeal({super.key, required this.repository});

  final Repository repository;

  // Altyazı stilini oluşturan widget
  Widget _buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Açıklama metnini oluşturan widget
  Widget _buildDescription(String? description) {
    return Text(
      description ?? "",
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<ItemModel>(
        future: repository.randomMeals(), // Rastgele yemek verilerini getirme
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Veri alındıysa, listeyi newItem olarak atama
            List<Meals>? newItem = snapshot.data!.meals;
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ItemScreen.routeName,
                  arguments:
                      newItem[0].strMeal, // Yeni ekrana yemek adı gönderme
                );
              },
              child: Container(
                height: 350,
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(31, 126, 121, 121),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Yemek resmini gösteren widget
                    Image.network(
                      '${newItem![0].strMealThumb}',
                      height: 190,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 12),
                    // Yemek adını gösteren widget
                    Text(
                      '${newItem[0].strMeal}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // Kategori bilgilerini gösteren satır
                    Row(
                      children: [
                        _buildSubtitle('Category: '),
                        _buildDescription(newItem[0].strCategory),
                      ],
                    ),
                    // Yer bilgilerini gösteren satır
                    Row(
                      children: [
                        _buildSubtitle('Place: '),
                        _buildDescription(newItem[0].strArea),
                      ],
                    ),
                  ],
                ),
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
