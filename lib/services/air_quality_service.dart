import 'dart:developer';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class AirQualityService {
  static const API_KEY = 'your_api_key_here';
  // get lat and long of device
  String LATITUDE = '15.34';
  String LONGITUDE = '44.19';

  Future<Map<String, dynamic>> getAirQuality() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LATITUDE = position.latitude.toString();
    LONGITUDE = position.longitude.toString();
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day);
    String y1 = DateFormat('yyyy-MM-dd').format(yesterday);
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 2);
    String t1 = DateFormat('yyyy-MM-dd').format(tomorrow);
    String url =
        'https://air-quality-api.open-meteo.com/v1/air-quality?latitude=$LATITUDE&longitude=$LONGITUDE&hourly=pm10,pm2_5,carbon_monoxide,sulphur_dioxide,ozone,uv_index,uv_index_clear_sky&domains=cams_global&start_date=${y1}&end_date=${t1}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // log('$data');
      return data;
    } else {
      // If that call was not successful, throw an error.
      log("${json.decode(response.body)}");
      throw Exception('Failed to fetch weather data');
    }
  }
}
