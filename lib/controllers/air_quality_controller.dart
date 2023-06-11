
import 'package:flutter/material.dart';
import 'package:meteo1/models/air_quality_model.dart';
import 'package:meteo1/services/air_quality_service.dart';


class AirQualityController extends ChangeNotifier {
  final AirQualityService airQualityService = AirQualityService();
  AirQualityModal? data;


  Future<void> fetch() async {
    // Make service call and inject results into the model
    var temp = await airQualityService.getAirQuality();
    data = AirQualityModal.fromJson(temp);
    notifyListeners();
  }
}
