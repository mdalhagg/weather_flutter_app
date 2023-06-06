import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meteo1/models/home_model.dart';
import 'package:weather_icons/weather_icons.dart';

Widget AirQuality(data, data1) {
  dynamic? _data = data;
  Hourly? _data1 = data1;
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
    log("${_data1!.toJson()}");

    _ui(String icon) {
      return Flexible(
        flex: 2,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(WeatherIcons.fromString("$icon"),
                color: const Color.fromARGB(255, 149, 149, 149), size: 20),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('xxxxx',
                    style: TextStyle(
                      color: Color.fromARGB(233, 114, 114, 114),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    )),
                Text('24°',
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
                padding: const EdgeInsets.all(20.0),
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
                          const Row(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(spacing: 40, runSpacing: 30, children: [
                      _ui("wi-day-cloudy"),
                      _ui("wi-cloudy-gusts"),
                      _ui("wi-raindrops"),
                      _ui("wi-day-showers"),
                      _ui("wi-day-haze"),
                      _ui("wi-windy"),
                    ]),
                  ],
                ),
              )),
        ));
  }
}
