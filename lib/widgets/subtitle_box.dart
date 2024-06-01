import 'package:flutter/material.dart';

import '../theme.dart';

class Subtitle extends StatelessWidget {
  final String title;

  const Subtitle(this.title, {super.key});

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 20, 0, 16),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: primaryColor,
          fontSize: 26,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildSectionTitle(context, title);
  }
}
