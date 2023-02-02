import 'package:fitnut/components/workout_icon.dart';
import 'package:fitnut/screens/pose_detector_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/heat_map.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   toolbarHeight: 60.0,
      //   title: Text(
      //     "FITNUT",
      //     style: GoogleFonts.oswald(
      //         fontSize: 30,
      //         fontWeight: FontWeight.bold,
      //         color: const Color(0xFFEEEEEE)),
      //   ),
      //   backgroundColor: const Color(0xFF222831),
      //   elevation: 0,
      // ),
      backgroundColor: const Color(0xFF222831),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Aadhithya",
                style: GoogleFonts.oswald(
                    fontSize: 25, color: const Color(0xFFEEEEEE)),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 360, child: MyHeatMap()),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Workouts",
                style: GoogleFonts.oswald(
                    fontSize: 25, color: const Color(0xFFEEEEEE)),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PoseDetectorView()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: WorkoutIcon(
                          image: "lib/images/push-up.png",
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: WorkoutIcon(image: "lib/images/squat.png"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: WorkoutIcon(image: "lib/images/pull-up.png"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: WorkoutIcon(image: "lib/images/sit-up.png"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: WorkoutIcon(image: "lib/images/jogging.png"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: WorkoutIcon(image: "lib/images/jump-rope.png"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Yoga",
                style: GoogleFonts.oswald(
                    fontSize: 25, color: const Color(0xFFEEEEEE)),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: WorkoutIcon(image: "lib/images/push-up.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: WorkoutIcon(image: "lib/images/push-up.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: WorkoutIcon(image: "lib/images/push-up.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: WorkoutIcon(image: "lib/images/push-up.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: WorkoutIcon(image: "lib/images/push-up.png"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
