import 'package:flutter/material.dart';
import 'dart:math' as math;

Widget WeeklyForecast(data) {
  return ConstrainedBox(
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 5,
                        child: Text(
                          '46',
                          style: TextStyle(
                            color: Color.fromARGB(255, 217, 217, 217),
                            backgroundColor: Color.fromARGB(255, 255, 133, 133),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        // Flexible(
        //     flex: 2,
        //     child: Card(
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(50)),
        //       clipBehavior: Clip.antiAliasWithSaveLayer,
        //       elevation: 5,
        //       color: Color.fromARGB(255, 176, 100, 235),
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           gradient: LinearGradient(
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //             colors: [
        //               Color.fromARGB(255, 255, 255, 255),
        //               Color.fromARGB(255, 234, 234, 234)
        //             ],
        //           ),
        //         ),
        //         child: const Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Text(
        //                 'SUN',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 20,
        //                 ),
        //               ),
        //               Text(
        //                 '12 - june',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 132, 132, 132),
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 10,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 15,
        //               ),
        //               Icon(
        //                 Icons.wb_sunny_outlined,
        //                 color: Color.fromARGB(255, 92, 92, 92),
        //                 size: 50,
        //               ),
        //               Text(
        //                 '24°',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 30,
        //                 ),
        //               ),
        //               Card(
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.only(
        //                         topLeft: Radius.circular(20),
        //                         topRight: Radius.circular(20),
        //                         bottomLeft: Radius.circular(20),
        //                         bottomRight: Radius.circular(20))),
        //                 clipBehavior: Clip.antiAliasWithSaveLayer,
        //                 elevation: 5,
        //                 child: Text(
        //                   '46',
        //                   style: TextStyle(
        //                     color: Color.fromARGB(255, 217, 217, 217),
        //                     backgroundColor: Color.fromARGB(255, 255, 133, 133),
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     )),
        // Flexible(
        //     flex: 2,
        //     child: Card(
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(50)),
        //       clipBehavior: Clip.antiAliasWithSaveLayer,
        //       elevation: 5,
        //       color: Color.fromARGB(255, 176, 100, 235),
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           gradient: LinearGradient(
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //             colors: [
        //               Color.fromARGB(255, 255, 255, 255),
        //               Color.fromARGB(255, 234, 234, 234)
        //             ],
        //           ),
        //         ),
        //         child: const Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Text(
        //                 'SUN',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 20,
        //                 ),
        //               ),
        //               Text(
        //                 '12 - june',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 132, 132, 132),
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 10,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 15,
        //               ),
        //               Icon(
        //                 Icons.wb_sunny_outlined,
        //                 color: Color.fromARGB(255, 92, 92, 92),
        //                 size: 50,
        //               ),
        //               Text(
        //                 '24°',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 30,
        //                 ),
        //               ),
        //               Card(
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.only(
        //                         topLeft: Radius.circular(20),
        //                         topRight: Radius.circular(20),
        //                         bottomLeft: Radius.circular(20),
        //                         bottomRight: Radius.circular(20))),
        //                 clipBehavior: Clip.antiAliasWithSaveLayer,
        //                 elevation: 5,
        //                 child: Text(
        //                   '46',
        //                   style: TextStyle(
        //                     color: Color.fromARGB(255, 217, 217, 217),
        //                     backgroundColor: Color.fromARGB(255, 255, 133, 133),
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     )),
        // Flexible(
        //     flex: 2,
        //     child: Card(
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(50)),
        //       clipBehavior: Clip.antiAliasWithSaveLayer,
        //       elevation: 5,
        //       color: Color.fromARGB(255, 176, 100, 235),
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           gradient: LinearGradient(
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //             colors: [
        //               Color.fromARGB(255, 255, 255, 255),
        //               Color.fromARGB(255, 234, 234, 234)
        //             ],
        //           ),
        //         ),
        //         child: const Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Text(
        //                 'SUN',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 20,
        //                 ),
        //               ),
        //               Text(
        //                 '12 - june',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 132, 132, 132),
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 10,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 15,
        //               ),
        //               Icon(
        //                 Icons.wb_sunny_outlined,
        //                 color: Color.fromARGB(255, 92, 92, 92),
        //                 size: 50,
        //               ),
        //               Text(
        //                 '24°',
        //                 style: TextStyle(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 30,
        //                 ),
        //               ),
        //               Card(
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.only(
        //                         topLeft: Radius.circular(20),
        //                         topRight: Radius.circular(20),
        //                         bottomLeft: Radius.circular(20),
        //                         bottomRight: Radius.circular(20))),
        //                 clipBehavior: Clip.antiAliasWithSaveLayer,
        //                 elevation: 5,
        //                 child: Text(
        //                   '46',
        //                   style: TextStyle(
        //                     color: Color.fromARGB(255, 217, 217, 217),
        //                     backgroundColor: Color.fromARGB(255, 255, 133, 133),
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //               ),
                      
        //             ],
        //           ),
        //         ),
        //       ),
        //     )),
      ],
    ),
  );
}
