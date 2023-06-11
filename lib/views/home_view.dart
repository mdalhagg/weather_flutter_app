import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meteo1/controllers/air_quality_controller.dart';
import 'package:meteo1/controllers/check_location_is_enable.dart';
import 'package:meteo1/controllers/home_controller.dart';
import 'package:meteo1/widgets/air_qualtiy.dart';
import 'package:meteo1/widgets/currant_weather.dart';
import 'package:meteo1/widgets/weekly_forecast.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = HomeController();
  final AirQualityController airQualityController = AirQualityController();
  final Check_location check_location = Check_location();

  @override
  void initState() {
    super.initState();
    // location controller
    check_location.addListener(() {
      setState(() {
        check_location.getCurrentLocation();
      });
    });
    check_location.getCurrentLocation();
    // home controller
    homeController.addListener(() {
      setState(() {
        homeController.fetch();
      });
    });
    homeController.fetch();
    // air quality controller
    airQualityController.addListener(() {
      setState(() {
        airQualityController.fetch();
      });
    });
    airQualityController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    uICurrentWeather() {
      return CurrantWeather(homeController.data);
    }

    _ui_air_quality() {
      return AirQuality(airQualityController.data, homeController.data);
    }

    _ui_week_forecast() {
      return WeeklyForecast(airQualityController.data, homeController.data);
    }

    return Scaffold(
        // backgroundColor: Color.fromARGB(252, 241, 229, 241),
        appBar: AppBar(
            elevation: 0,
            toolbarHeight: 80,
            centerTitle: true,
            // backgroundColor: Color.fromARGB(0, 255, 150, 229),
            title: const Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      // foregroundColor: Color.fromARGB(255, 0, 0, 0),
                      // backgroundColor: Color.fromARGB(255, 92, 92, 92),
                      radius: 30,
                      child: Icon(Icons.menu_rounded, size: 30),
                    ),
                    Row(children: [
                      Icon(Icons.location_on_outlined,
                          size: 20,
                          color: Color.fromARGB(255, 153, 145, 251),
                          shadows: [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 0, 0),
                              blurRadius: 2,
                              offset: const Offset(1, 1),
                            )
                          ]),
                      Text('Home',
                          style: TextStyle(
                            // color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ]),
                    CircleAvatar(
                      // backgroundColor: Color.fromARGB(255, 92, 92, 92),
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                  ],
                ),
              ],
            )),
        body: Container(
          // color: Color.fromARGB(255, 241, 229, 241),
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              uICurrentWeather(),
              // first widget

              const SizedBox(height: 20),
              // scound widget
              _ui_air_quality(),
              const SizedBox(height: 20),
              // last widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Weekly forecast",
                    style: TextStyle(
                      // color: Color.fromARGB(233, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/details');
                    },
                    icon: const Icon(
                      Icons.navigate_next,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _ui_week_forecast(),
              const SizedBox(height: 10),
            ]),
          ),
        ));
  }
}
