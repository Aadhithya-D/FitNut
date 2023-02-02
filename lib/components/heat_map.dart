import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: HeatMapCalendar(
          // weekTextColor: const Color(0xFfEEEEEE),
          textColor: const Color(0xFF222831),
          defaultColor: Colors.white,
          flexible: true,
          colorMode: ColorMode.opacity,
          datasets: {
            DateTime(2023, 2, 6): 3,
            DateTime(2023, 2, 7): 7,
            DateTime(2023, 2, 8): 10,
            DateTime(2023, 2, 9): 13,
            DateTime(2023, 2, 13): 6,
          },
          showColorTip: false,
          colorsets: const {
            1: Color(0xFF00ADB5),
          },
        ),
      ),
    );
  }
}
