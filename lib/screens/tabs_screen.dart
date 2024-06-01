import 'package:flutter/material.dart';

import '../screens/home-screen.dart';
import 'category-screen.dart';
import '../widgets/app_bar_home.dart';
import '../widgets/navigator_bottom.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Widget>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const HomeScreen(),
      },
      {
        'page': CategoryScreen(),
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: navigationBar(_selectPage, _selectedPageIndex),
    );
  }
}
