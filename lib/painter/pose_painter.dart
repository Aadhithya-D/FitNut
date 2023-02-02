import 'package:fitnut/controllers/rep_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import 'coordinates_translator.dart';

bool up = false;
int rep = 0;

class PosePainter extends CustomPainter {
  PosePainter(this.poses, this.absoluteImageSize, this.rotation, this.workout);

  final List<Pose> poses;
  final Size absoluteImageSize;
  final InputImageRotation rotation;
  final RepController repController = Get.put(RepController());
  final workout;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.green;

    final leftPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.yellow;

    final rightPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.blueAccent;

    for (final pose in poses) {
      pose.landmarks.forEach((_, landmark) {
        canvas.drawCircle(
            Offset(
              translateX(landmark.x, rotation, size, absoluteImageSize),
              translateY(landmark.y, rotation, size, absoluteImageSize),
            ),
            1,
            paint);
      });

      void paintLine(
          PoseLandmarkType type1, PoseLandmarkType type2, Paint paintType) {
        final PoseLandmark joint1 = pose.landmarks[type1]!;
        final PoseLandmark joint2 = pose.landmarks[type2]!;
        canvas.drawLine(
            Offset(translateX(joint1.x, rotation, size, absoluteImageSize),
                translateY(joint1.y, rotation, size, absoluteImageSize)),
            Offset(translateX(joint2.x, rotation, size, absoluteImageSize),
                translateY(joint2.y, rotation, size, absoluteImageSize)),
            paintType);
      }

      if (workout == "Push Up") {
        final k1 = pose.landmarks[PoseLandmarkType.leftShoulder]!;
        final k2 = pose.landmarks[PoseLandmarkType.leftElbow]!;
        print(workout);
        if (translateX(k1.x, rotation, size, absoluteImageSize) >
            translateX(k2.x, rotation, size, absoluteImageSize)) {
          up = true;
          // print("true");
        }
        if (translateX(k1.x, rotation, size, absoluteImageSize) <
                translateX(k2.x, rotation, size, absoluteImageSize) &&
            up) {
          RepController.rep[1]++;
          up = false;
        }
      } else if (workout == "Squat") {
        final k1 = pose.landmarks[PoseLandmarkType.rightHip]!;
        final k2 = pose.landmarks[PoseLandmarkType.rightKnee]!;
        final k3 = pose.landmarks[PoseLandmarkType.leftHip]!;
        final k4 = pose.landmarks[PoseLandmarkType.leftKnee]!;
        if (translateX(k1.x, rotation, size, absoluteImageSize) - 50 >
                translateX(k2.x, rotation, size, absoluteImageSize) &&
            translateX(k3.x, rotation, size, absoluteImageSize) - 50 >
                translateX(k4.x, rotation, size, absoluteImageSize)) {
          up = true;
        }
        if (translateX(k1.x, rotation, size, absoluteImageSize) - 50 <
                translateX(k2.x, rotation, size, absoluteImageSize) &&
            translateX(k3.x, rotation, size, absoluteImageSize) - 50 <
                translateX(k4.x, rotation, size, absoluteImageSize) &&
            up) {
          RepController.rep[0]++;
          up = false;
        }
      }
      //Draw arms
      paintLine(
          PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow, leftPaint);
      paintLine(
          PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist, leftPaint);
      paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow,
          rightPaint);
      paintLine(
          PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist, rightPaint);

      //Draw Body
      paintLine(
          PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip, leftPaint);
      paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightHip,
          rightPaint);

      //Draw legs
      paintLine(PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee, leftPaint);
      paintLine(
          PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle, leftPaint);
      paintLine(
          PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee, rightPaint);
      paintLine(
          PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle, rightPaint);
    }
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.poses != poses;
  }
}
