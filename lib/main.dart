import 'package:flutter/material.dart';
import 'package:meteo1/views/details_view.dart';
import 'package:meteo1/views/home_view.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 241, 229, 241),
        foregroundColor: Colors.black,
      ), colorScheme: const ColorScheme(background: Colors.white),
    ),
    darkTheme: ThemeData(
      useMaterial3: true,
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        foregroundColor: Color.fromARGB(255, 146, 146, 146),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple, brightness: Brightness.dark,),
    ),
    routes: {
      '/': (context) => const HomeView(),
      '/details': (context) => const DetailsView(),
    },
  ));
}
