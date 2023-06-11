
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

Widget AirQuality(data, data1) {
  dynamic data0 = data;
  dynamic data10 = data1;

  if (data0 == null || data10 == null) {
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
                                    color: const Color.fromARGB(255, 0, 0, 0),
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
                    const Center(
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
                Text('$data $degree',
                    style: const TextStyle(
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
                                    color: const Color.fromARGB(255, 0, 0, 0),
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
                                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
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
                          data10!.hourly!.toJson()['windspeed_10m'][10],
                          data10!.hourlyUnits!.windspeed10m),
                      _ui(
                          "wi-raindrops",
                          "SO2",
                          data0!.hourly!.toJson()['sulphur_dioxide'][10],
                          data0!.hourlyUnits!.sulphurDioxide),
                      _ui("wi-day-showers", "Chance of \n Rain", null, null),
                      _ui(
                          "wi-day-haze",
                          "UV Index",
                          data0!.hourly!.toJson()['uv_index'][10],
                          data0!.hourlyUnits!.uvIndex),
                      _ui("wi-windy", "O3",
                          data0!.hourly!.toJson()['ozone'][10], "o3"),
                    ]),
                  ],
                ),
              )),
        ));
  }
}
