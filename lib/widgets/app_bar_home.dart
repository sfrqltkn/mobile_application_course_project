import 'package:flutter/material.dart';

import '../theme.dart';

AppBar homeAppBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: const Color(0xff8395a7),
    elevation: 0,
    title: RichText(
      text: const TextSpan(children: [
        TextSpan(
          text: 'The',
          style: TextStyle(
              color: titleColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        TextSpan(
            text: 'Meal',
            style: TextStyle(
                color: titleColor2, fontSize: 24, fontWeight: FontWeight.bold))
      ]),
    ),
  );
}
