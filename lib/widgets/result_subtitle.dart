import 'package:flutter/material.dart';

import '../theme.dart';

class ResultSubtitle extends StatelessWidget {
  const ResultSubtitle(
      {super.key, required this.category, required this.lenght});

  final String category;
  final int lenght;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 24, 0, 16),
      alignment: Alignment.centerLeft,
      child: Text(
        '$lenght resultados para "$category"',
        style: const TextStyle(
          color: primaryColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
