import 'package:flutter/material.dart';

import '../model/item_model.dart';
import '../resources/repository.dart';
import '../screens/item-screen.dart';

class CardMealResult extends StatelessWidget {
  const CardMealResult({
    super.key,
    required this.repository,
    required this.title,
  });

  final Repository repository; // Veri kaynağı
  final String title; // Yemek başlığı

  // Altyazı stili oluşturan widget
  Widget _buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Açıklama metni stili oluşturan widget
  Widget _buildDescription(String? description) {
    return Text(
      description ?? "", // Eğer açıklama yoksa boş bir string göster
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<ItemModel>(
        // Başlık ile yemeği arayan future
        future: repository.searchMeals(title),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Veri geldiyse, yemeği al
            List<Meals>? newItem = snapshot.data!.meals;
            return GestureDetector(
              // Yemeğe tıklanınca detay ekranına git
              onTap: () {
                Navigator.of(context).pushNamed(
                  ItemScreen.routeName,
                  arguments: newItem[0].strMeal,
                );
              },
              child: Container(
                height: 280,
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(31, 105, 104, 104),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 4,
                      blurRadius: 12,
                      offset: const Offset(0, 4), // gölgenin konumunu değiştirir
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Yemek resmini gösteren widget
                    Container(
                      child: Image.network(
                        '${newItem![0].strMealThumb}',
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Yemek adını gösteren widget
                    Text(
                      '${newItem[0].strMeal}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // Kategori bilgisini gösteren satır
                    Row(
                      children: [
                        _buildSubtitle('Category: '),
                        _buildDescription(newItem[0].strCategory),
                      ],
                    ),
                    // Yer bilgisini gösteren satır
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
