import 'package:flutter/material.dart';

import '../theme.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const SearchBox({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: secundaryColor.withOpacity(0.32),
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: textColor,
              size: 24,
            ),
            hintText: 'Pesquisar',
            hintStyle: TextStyle(color: textColor)),
      ),
    );
  }
}
