import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

Widget WeeklyForecast(airQuality, Home) {
  dynamic airQuality0 = airQuality;
  dynamic home = Home;
  DateTime? now = DateTime.now();
  String format = DateFormat('HH').format(now);

  if (airQuality0 == null || home == null) {
    return const SizedBox(
      height: 210,
      child: Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 86, 100, 237),
        ),
      ),
    );
  } else {
    int length = (airQuality0!.hourly!.toJson()['time'].length).toInt();
    dynamic day = home!.currentWeather;
    _ui_weather(code) {
      String? icon = 'wi-day-sunny';
      if (day!.isDay == 1) {
        if (code == 0) {
          // Clear sky
          icon = "wi-day-sunny";
        }
        if (code == 1 || code == 2 || code == 3) {
          // partly cloudy
          icon = "wi-day-cloudy";
        }
        if (code == 45 || code == 46) {
          icon = "wi-fog";
        }
        if (code == 51 || code == 52 || code == 53 || code == 54) {
          icon = "wi-sleet";
        }
        if (code == 56 || code == 57) {
          icon = "wi-snowflake-cold";
        }
        if (code == 61 || code == 63 || code == 65) {
          icon = "wi-rain";
        }
      } else {
        if (code == 0) {
          // Clear sky
          icon = "wi-moonrise";
        }
        if (code == 1 || code == 2 || code == 3) {
          // partly cloudy
          icon = "wi-night-cloudy";
        }
        if (code == 45 || code == 46) {
          icon = "wi-fog";
        }
        if (code == 51 || code == 52 || code == 53 || code == 54) {
          icon = "wi-sleet";
        }
        if (code == 56 || code == 57) {
          icon = "wi-snowflake-cold";
        }
        if (code == 61 || code == 63 || code == 65) {
          icon = "wi-rain";
        }
      }
      return icon;
    }

    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: math.max(220, 140),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ListView.builder(
              dragStartBehavior: DragStartBehavior.start,
              itemBuilder: (context, index) {
                DateTime now = DateTime.now();
                DateTime time =
                    DateTime.parse(airQuality0.hourly.toJson()['time'][index]);
                DateTime date1 =
                    DateTime.parse(airQuality0.hourly.toJson()['time'][index]);
                String day = DateFormat.E().format(time);
                String Month = DateFormat.MMMd().format(time);
                String format1 = DateFormat('HH').format(date1);
                log("$format   $format1   $length");

                return Flexible(
                    flex: 2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5,
                      color: const Color.fromARGB(255, 176, 100, 235),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: date1.day == now.day
                                ? [
                                    const Color.fromARGB(255, 219, 219, 219),
                                    const Color.fromARGB(255, 86, 86, 86)
                                  ]
                                : [
                                    const Color.fromARGB(255, 219, 96, 216),
                                    const Color.fromARGB(255, 86, 100, 237)
                                  ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                day,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                Month,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 217, 217, 217),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                              Icon(
                                WeatherIcons.fromString(_ui_weather(home.hourly
                                    .toJson()["weathercode"][index]
                                    .toInt())),
                                color: const Color.fromARGB(255, 216, 216, 216),
                                size: 40,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${home.hourly.toJson()["temperature_2m"][index].toInt()}°',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 5,
                                child: Text(
                                  '${home!.hourly.toJson()["winddirection_10m"][index].toInt()}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 217, 217, 217),
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 133, 133),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              },
              itemCount: length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ));
  }
}
