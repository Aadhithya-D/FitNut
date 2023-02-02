import 'package:flutter/material.dart';

class WorkoutIcon extends StatelessWidget {
  final image;
  const WorkoutIcon({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF393E46),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
