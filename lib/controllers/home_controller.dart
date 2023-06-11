
import 'package:flutter/material.dart';
import 'package:meteo1/models/home_model.dart';
import 'package:meteo1/services/home_service.dart';

class HomeController extends ChangeNotifier {
  final HomeService homeService = HomeService();
  HomeModel? data;
  

  Future<void> fetch() async {
    // Make service call and inject results into the model
    var temp = await homeService.getCurrentWeather();
    data = HomeModel.fromJson(temp);
    notifyListeners();
  }
}
