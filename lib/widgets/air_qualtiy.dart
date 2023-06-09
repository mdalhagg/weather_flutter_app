import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meteo1/controllers/air_quality_controller.dart';
import 'package:meteo1/models/home_model.dart';
import 'package:weather_icons/weather_icons.dart';

Widget AirQuality(data, data1) {
  dynamic? _data = data;
  dynamic? _data1 = data1;

  if (_data == null || _data1 == null) {
    return SizedBox(
        width: double.infinity,
        height: 200,
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
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 234, 234, 234)
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.fromString("wi-rain"),
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 25),
                                const SizedBox(width: 10),
                                const Text('Air Quality',
                                    style: TextStyle(
                                      color: Color.fromARGB(233, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ))
                              ]),
                          SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  foregroundColor: Color.fromARGB(255, 0, 0, 0),
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  radius: 20,
                                  child: Icon(Icons.refresh, size: 20),
                                ),
                              ])
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 86, 100, 237),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  } else {
    _ui(String icon, String text, dynamic data, dynamic degree) {
      DateTime now = DateTime.now();
      // get hour
      int hour = now.hour;
      // log("${hour.toString()}");

      return Flexible(
        flex: 6,
        fit: FlexFit.tight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(WeatherIcons.fromString(icon),
                color: const Color.fromARGB(255, 149, 149, 149), size: 20),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(text,
                    style: const TextStyle(
                      color: Color.fromARGB(233, 114, 114, 114),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    )),
                Text('${data} ${degree}',
                    style: TextStyle(
                      color: Color.fromARGB(233, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    )),
              ],
            ),
          ],
        ),
      );
    }

    return SizedBox(
        width: double.infinity,
        height: 200,
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
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 234, 234, 234)
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.fromString("wi-rain"),
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 25),
                                const SizedBox(width: 10),
                                const Text('Air Quality',
                                    style: TextStyle(
                                      color: Color.fromARGB(233, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ))
                              ]),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  foregroundColor: Color.fromARGB(255, 0, 0, 0),
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  radius: 20,
                                  child: IconButton(
                                      onPressed: () {
                                        // _data = null;
                                      },
                                      icon:
                                          const Icon(Icons.refresh, size: 20)),
                                ),
                              ])
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(spacing: 40, runSpacing: 30, children: [
                      _ui("wi-day-cloudy", "Reel Feels", null, null),
                      _ui(
                          "wi-cloudy-gusts",
                          "Wind",
                          _data1!.hourly!.toJson()['windspeed_10m'][10],
                          _data1!.hourlyUnits!.windspeed10m),
                      _ui(
                          "wi-raindrops",
                          "SO2",
                          _data!.hourly!.toJson()['sulphur_dioxide'][10],
                          _data!.hourlyUnits!.sulphurDioxide),
                      _ui("wi-day-showers", "Chance of \n Rain", null, null),
                      _ui(
                          "wi-day-haze",
                          "UV Index",
                          _data!.hourly!.toJson()['uv_index'][10],
                          _data!.hourlyUnits!.uvIndex),
                      _ui("wi-windy", "O3",
                          _data!.hourly!.toJson()['ozone'][10], "o3"),
                    ]),
                  ],
                ),
              )),
        ));
  }
}
