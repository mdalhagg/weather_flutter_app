import 'package:flutter/material.dart';
import 'package:meteo1/controllers/air_quality_controller.dart';
import 'package:meteo1/controllers/home_controller.dart';
import 'package:meteo1/widgets/ui_gauge.dart';
import 'package:meteo1/widgets/weekly_forecast.dart';
import 'package:sliding_switch/sliding_switch.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final AirQualityController airQualityController = AirQualityController();
  final HomeController homeController = HomeController();
  @override
  void initState() {
    super.initState();
    airQualityController.addListener(() {
      setState(() {
        airQualityController.fetch();
      });
    });
    airQualityController.fetch();
    homeController.addListener(() {
      setState(() {
        homeController.fetch();
      });
    });
    homeController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = homeController.data;
    bool light0 = true;
    bool light1 = false;

    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check);
        }
        return const Icon(Icons.close);
      },
    );
    _ui_week_forecast() {
      return WeeklyForecast(airQualityController.data, homeController.data);
    }

    uiGauge() {
      return UiGauge(homeController.data);
    }

    return Scaffold(
        backgroundColor: const Color.fromARGB(252, 221, 206, 243),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Wrap(
                    children: [
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50))),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    // foregroundColor:
                                    // Color.fromARGB(255, 0, 0, 0),
                                    // backgroundColor:
                                    //     Color.fromARGB(255, 255, 255, 255),
                                    radius: 30,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                      ),
                                    ),
                                  ),
                                  const Row(children: [
                                    Icon(Icons.location_on_outlined,
                                        size: 20,
                                        color:
                                            Color.fromARGB(255, 153, 145, 251),
                                        shadows: [
                                          BoxShadow(
                                            // color: Color.fromARGB(255, 0, 0, 0),
                                            blurRadius: 2,
                                            offset: Offset(1, 1),
                                          )
                                        ]),
                                    Text('Details',
                                        style: TextStyle(
                                          // color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                                  const CircleAvatar(
                                    // backgroundColor:
                                    // Color.fromARGB(255, 255, 239, 150),
                                    radius: 30,
                                    child: Icon(Icons.person),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SlidingSwitch(
                                    value: false,
                                    width: 200,
                                    onChanged: (bool value) {
                                      print(value);
                                    },
                                    height: 55,
                                    animationDuration:
                                        const Duration(milliseconds: 400),
                                    onTap: () {},
                                    onDoubleTap: () {},
                                    onSwipe: () {},
                                    textOff: "Day",
                                    textOn: "Month",
                                    contentSize: 17,
                                    colorOn: const Color.fromARGB(255, 0, 0, 0),
                                    colorOff: const Color(0xff6682c0),
                                    background:
                                        const Color.fromARGB(255, 219, 96, 216),
                                    buttonColor: const Color(0xfff7f5f7),
                                    inactiveColor:
                                        const Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _ui_week_forecast(),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: uiGauge(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
