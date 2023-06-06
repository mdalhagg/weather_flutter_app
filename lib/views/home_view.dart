import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:meteo1/controllers/air_quality_controller.dart';
import 'package:meteo1/controllers/home_controller.dart';
import 'package:meteo1/models/home_model.dart';
import 'package:meteo1/services/home_service.dart';
import 'package:meteo1/widgets/air_qualtiy.dart';
import 'package:meteo1/widgets/currant_weather.dart';
import 'package:geolocator/geolocator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = HomeController();
  final AirQualityController airQualityController = AirQualityController();

  @override
  void initState() {
    super.initState();
    homeController.addListener(() {
      setState(() {
        homeController.fetch();
      });
    });
        homeController.fetch();
    airQualityController.addListener(() {
      setState(() {
        airQualityController.fetch();
      });
    });
    airQualityController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    _ui_currant_weather() {
      return CurrantWeather(homeController.data);
    }

    ;
    _ui_air_quality() {
      return AirQuality(airQualityController.data , homeController.data);
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(252, 241, 229, 241),
        appBar: AppBar(
            elevation: 0,
            toolbarHeight: 80,
            centerTitle: true,
            backgroundColor: Color.fromARGB(0, 255, 150, 229),
            title: const Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      foregroundColor: Color.fromARGB(255, 0, 0, 0),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ]),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 255, 239, 150),
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                  ],
                ),
              ],
            )),
        body: Container(
          color: Color.fromARGB(255, 241, 229, 241),
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              _ui_currant_weather(),
              // first widget

              const SizedBox(height: 20),
              // scound widget
              _ui_air_quality(),
              const SizedBox(height: 20),
              // last widget
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Weekly forecast",
                    style: TextStyle(
                      color: Color.fromARGB(233, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "Next Month >",
                    style: TextStyle(
                      color: Color.fromARGB(233, 173, 152, 201),
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: math.max(220, 100),
                ),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 0,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 5,
                          color: Color.fromARGB(255, 176, 100, 235),
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
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'SUN',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '12 - june',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Color.fromARGB(255, 216, 216, 216),
                                    size: 50,
                                  ),
                                  Text(
                                    '24°',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Text(
                                    '46',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 133, 133),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Flexible(
                        flex: 2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 5,
                          color: Color.fromARGB(255, 176, 100, 235),
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
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'SUN',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '12 - june',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 132, 132, 132),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                    size: 50,
                                  ),
                                  Text(
                                    '24°',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Text(
                                    '46',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 133, 133),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Flexible(
                        flex: 2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 5,
                          color: Color.fromARGB(255, 176, 100, 235),
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
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'SUN',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '12 - june',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 132, 132, 132),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                    size: 50,
                                  ),
                                  Text(
                                    '24°',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Text(
                                    '46',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 133, 133),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Flexible(
                        flex: 2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 5,
                          color: Color.fromARGB(255, 176, 100, 235),
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
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'SUN',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '12 - june',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 132, 132, 132),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                    size: 50,
                                  ),
                                  Text(
                                    '24°',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Text(
                                    '46',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 133, 133),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
