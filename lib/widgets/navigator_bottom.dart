import 'package:flutter/material.dart';

import '../theme.dart';

BottomNavigationBar navigationBar(
    void Function(int) selectPage, int selectedPageIndex) {
  return BottomNavigationBar(
    onTap: selectPage,
    backgroundColor: const Color(0xff8395a7),
    currentIndex: selectedPageIndex,
    unselectedFontSize: 16,
    selectedFontSize: 20,
    selectedIconTheme: const IconThemeData(color: secundaryColor),
    unselectedIconTheme: const IconThemeData(color: primaryColor),
    unselectedLabelStyle: const TextStyle(color: primaryColor),
    selectedItemColor: Colors.white,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.category_sharp),
        label: 'Category',
      ),
    ],
  );
}
