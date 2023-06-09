import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:meteo1/widgets/weekly_forecast.dart';
import 'package:sliding_switch/sliding_switch.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
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
      return WeeklyForecast();
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(252, 221, 206, 243),
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
                                    foregroundColor:
                                        Color.fromARGB(255, 0, 0, 0),
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
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
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            blurRadius: 2,
                                            offset: Offset(1, 1),
                                          )
                                        ]),
                                    Text('Details',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                                  const CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 239, 150),
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
                                    colorOn: Color.fromARGB(255, 0, 0, 0),
                                    colorOff: const Color(0xff6682c0),
                                    background:
                                        const Color.fromARGB(255, 219, 96, 216),
                                    buttonColor: const Color(0xfff7f5f7),
                                    inactiveColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _ui_week_forecast(),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: AnimatedRadialGauge(
                        /// The animation duration.
                        duration: const Duration(milliseconds: 500),

                        /// Gauge value.
                        value: 20,

                        /// Optionally, you can configure your gauge, providing additional
                        /// styles and transformers.
                        axis: GaugeAxis(
                          /// Render the gauge as a 260-degree arc.
                          /// min: 0,
                          max: 100,
                          degrees: 300,

                          /// Display the green value progress.
                          transformer: GaugeAxisTransformer.progress(
                              color: Color.fromARGB(200, 255, 255, 255),
                              blendColors: true,
                              reversed: true),

                          /// Set the background color and axis thickness.
                          style: const GaugeAxisStyle(
                            thickness: 20,
                            background: Color.fromARGB(255, 80, 100, 240),
                          ),

                          /// Define the pointer that will indicate the progress.
                          pointer: RoundedTrianglePointer(
                            size: 20,
                            backgroundColor: Colors.black,
                            borderRadius: 2,
                            border: const GaugePointerBorder(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        builder: (context, child, value) => RadialGaugeLabel(
                          value: 20.0,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 46,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
