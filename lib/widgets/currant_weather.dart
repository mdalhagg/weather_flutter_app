
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

Widget CurrantWeather(data) {
  dynamic data0 = data;
  DateTime? now = DateTime.now();
  String? Day = DateFormat.EEEE().format(now);
  String? Time = DateFormat.jm().format(now);
  // dateformater

  if (data0 == null) {
    return SizedBox(
        width: double.infinity,
        height: 250,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            color: const Color.fromARGB(255, 176, 100, 235),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 219, 96, 216),
                    Color.fromARGB(255, 86, 100, 237)
                  ],
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )));
  } else {
    dynamic weather = data!.currentWeather!.weathercode;
    dynamic day = data!.currentWeather;

    _ui_weather() {
      String? icon = 'wi-day-sunny';
      if (day!.isDay == 1) {
        if (weather == 0) {
          // Clear sky
          icon = "wi-day-sunny";
        }
        if (weather == 1 || weather == 2 || weather == 3) {
          // partly cloudy
          icon = "wi-day-cloudy";
        }
        if (weather == 45 || weather == 46) {
          icon = "wi-fog";
        }
        if (weather == 51 || weather == 52 || weather == 53 || weather == 54) {
          icon = "wi-sleet";
        }
        if (weather == 56 || weather == 57) {
          icon = "wi-snowflake-cold";
        }
        if (weather == 61 || weather == 63 || weather == 65) {
          icon = "wi-rain";
        }
      } else {
        if (weather == 0) {
          // Clear sky
          icon = "wi-night-moon";
        }
        if (weather == 1 || weather == 2 || weather == 3) {
          // partly cloudy
          icon = "wi-night-cloudy";
        }
        if (weather == 45 || weather == 46) {
          icon = "wi-fog";
        }
        if (weather == 51 || weather == 52 || weather == 53 || weather == 54) {
          icon = "wi-sleet";
        }
        if (weather == 56 || weather == 57) {
          icon = "wi-snowflake-cold";
        }
        if (weather == 61 || weather == 63 || weather == 65) {
          icon = "wi-rain";
        }
      }
      return icon;
    }

    return SizedBox(
        width: double.infinity,
        height: 250,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
          color: const Color.fromARGB(255, 176, 100, 235),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 219, 96, 216),
                    Color.fromARGB(255, 86, 100, 237)
                  ],
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Icon(
                                    WeatherIcons.fromString(_ui_weather()),
                                    color: Colors.white,
                                    size: 110)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${data!.currentWeather!.temperature.toInt()}°',
                                  style: const TextStyle(
                                    color: Color.fromARGB(233, 238, 221, 255),
                                    fontSize: 90,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Feels Like ${data!.currentWeather!.temperature.toInt() + 3}°',
                                  style: const TextStyle(
                                    color: Color.fromARGB(233, 238, 221, 255),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    _ui_weather()
                                        .substring(3)
                                        .replaceAll("-", " "),
                                    style: const TextStyle(
                                      color: Color.fromARGB(233, 238, 221, 255),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    )),
                                const SizedBox(width: 20),
                                Text('$Day, $Time',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(233, 238, 221, 255),
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                            Icon(WeatherIcons.fromString(_ui_weather()),
                                color: const Color.fromARGB(167, 171, 171, 171),
                                size: 50),
                            Icon(WeatherIcons.fromString("wi-strong-wind"),
                                color: const Color.fromARGB(167, 171, 171, 171),
                                size: 50),
                          ]),
                    ),
                  ])),
        ));
  }
}
