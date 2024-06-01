import 'package:flutter/material.dart';

import '../resources/repository.dart';
import '../widgets/card_meal.dart';
import '../widgets/subtitle_box.dart';

class BodyHome extends StatelessWidget {

  // Verileri almak için bir Repository nesnesi oluşturuyoruz
  final _repository = Repository();

  BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            const Subtitle('Recommended Dishes'),
            // Dört adet CardMeal widget'ı oluşturuyoruz
            for (int i = 0; i <= 3; i++) CardMeal(repository: _repository),
          ],
        ),
      ),
    );
  }
}
