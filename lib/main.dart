import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_application_course_project/screens/result_search-screen.dart';

import './screens/home-screen.dart';
import './screens/tabs_screen.dart';
import 'screens/category-screen.dart';
import 'screens/item-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealDB App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.merriweather().fontFamily),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryScreen.routeName: (ctx) => CategoryScreen(),
        ItemScreen.routeName: (ctx) => ItemScreen(),
        ResultSearchScreen.routeName: (ctx) => ResultSearchScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        );
      },
    );
  }
}
