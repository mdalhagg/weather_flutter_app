import 'dart:developer';
import 'package:meteo1/models/home_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeService {
  static const API_KEY = 'your_api_key_here';
  // get lat and long of device
  String LATITUDE = '15.34';
  String LONGITUDE = '44.19';

  Future<Map<String, dynamic>> getCurrentWeather() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LATITUDE = position.latitude.toString();
    LONGITUDE = position.longitude.toString();
    // log("$LATITUDE" + " " + "$LONGITUDE");
    String url =
        'https://api.open-meteo.com/v1/forecast?latitude=$LATITUDE&longitude=$LONGITUDE&hourly=temperature_2m,relativehumidity_2m,precipitation,weathercode,windspeed_10m,winddirection_10m&current_weather=true';
    final response = await http.get(Uri.parse(url));
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        Map<Permission, PermissionStatus> status = await [
          Permission.location,
        ].request();
      } else if (status.isDenied) {
// Location permission is
      }
    } else {
// Location permission is
    }
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
