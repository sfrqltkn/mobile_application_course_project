import 'package:flutter/material.dart';

import '../model/category_model.dart';
import '../resources/repository.dart';
import '../screens/result_search-screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.repository});

  final Repository repository; // Veri kaynağı

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<CategoryModel>(
        // Kategori modelini getiren future
        future: repository.searchCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Veri geldiyse, kategori listesini al
            List<Category> newCategory = snapshot.data!.categories;
            int length = newCategory.length;
            return GridView.count(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.3,
              crossAxisCount: 2,
              children: List.generate(length, (index) {
                // Kategori öğelerini oluştur
                return InkWell(
                  onTap: () {
                    // Tıklanan kategoriye göre sonuç sayfasına git
                    Navigator.of(context).pushNamed(
                      ResultSearchScreen.routeName,
                      arguments: newCategory[index].strCategory,
                    );
                  },
                  child: Card(
                    color: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 10,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        // Kategori resmi ve adını içeren stack
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.network(
                                '${newCategory[index].strCategoryThumb}',
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 70,
                              left: 1,
                              child: Container(
                                width: 300,
                                color: Colors.black54,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 18,
                                ),
                                child: Text(
                                  '${newCategory[index].strCategory}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
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
