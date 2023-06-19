import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnut/controllers/rep_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterWorkoutScreen extends StatefulWidget {
  AfterWorkoutScreen({super.key, required this.rep, required this.workout});

  int rep;
  final workout;

  @override
  State<AfterWorkoutScreen> createState() => _AfterWorkoutScreenState();
}

class _AfterWorkoutScreenState extends State<AfterWorkoutScreen> {
  void updateScore(int score) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    final db = FirebaseFirestore.instance;
    int oldScore = 0;
    var docSnapshot = await FirebaseFirestore.instance
        .collection("UserData")
        .doc(userID)
        .get();
    if (docSnapshot.exists) {
      var data = docSnapshot.data();
      oldScore = data!["score"];
    }
    await db
        .collection("UserData")
        .doc(userID)
        .update({"score": oldScore + score});
  }

  @override
  Widget build(BuildContext context) {
    int score = 0;
    int index = 0;
    if (widget.workout == "Push Up") {
      score = 100 * widget.rep;
      index = 1;
    } else {
      score = 50 * widget.rep;
      index = 0;
    }
    updateScore(score);
    return WillPopScope(
      onWillPop: () async {
        RepController.rep[index] = 0;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 60.0,
          title: Text(
            "FITNUT",
            style: GoogleFonts.oswald(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFEEEEEE)),
          ),
          backgroundColor: const Color(0xFF222831),
          elevation: 0,
        ),
        backgroundColor: const Color(0xFF222831),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total Reps: ${widget.rep}",
              style: GoogleFonts.oswald(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFEEEEEE)),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Score: $score",
              style: GoogleFonts.oswald(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFEEEEEE)),
            ),
          ],
        )),
      ),
    );
  }
}
