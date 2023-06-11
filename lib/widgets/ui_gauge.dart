import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

Widget UiGauge(data) {
  dynamic data0 = data;
  if (data0 == null) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  } else {
    return AnimatedRadialGauge(
      /// The animation duration.
      duration: const Duration(milliseconds: 500),

      /// Gauge value.
      value: data0!.currentWeather!.windspeed.toDouble(),

      /// Optionally, you can configure your gauge, providing additional
      /// styles and transformers.
      axis: GaugeAxis(
        /// Render the gauge as a 260-degree arc.
        /// min: 0,
        max: 100,
        degrees: 300,

        /// Display the green value progress.
        transformer: const GaugeAxisTransformer.progress(
            color: Color.fromARGB(200, 255, 255, 255),
            blendColors: true,
            reversed: true),

        /// Set the background color and axis thickness.
        style: GaugeAxisStyle(
          thickness: data0!.currentWeather!.windspeed.toDouble(),
          background: const Color.fromARGB(255, 80, 100, 240),
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
        value: data0!.currentWeather!.windspeed.toDouble(),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 46,
          fontWeight: FontWeight.bold,
        ),
        key: const Key('Speed Wind'),
      ),
    );
  }
}
