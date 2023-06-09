import 'package:flutter/material.dart';
import 'package:meteo1/views/details_view.dart';
import 'package:meteo1/views/home_view.dart';

void main() {
  
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
    ),
    routes: {
      '/': (context) => const HomeView(),
      '/details': (context) => const DetailsView(),
    },
  ));
}
