import 'package:fitnut/controllers/rep_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderboardScreen extends StatelessWidget {
  LeaderboardScreen({super.key});

  final RepController repContoller = Get.put(RepController());

  @override
  Widget build(BuildContext context) {
    RepController().getData();
    return Scaffold(
        backgroundColor: const Color(0xFF222831),
        body: Obx(() {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFF393E46)),
                height: 70,
                margin: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                child: Center(
                  child: ListTile(
                    title: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          repContoller.leaderBoard[index]['Name'].toString(),
                          style: const TextStyle(
                              fontSize: 20.0, color: Color(0xFFEEEEEE)),
                        ),
                      ],
                    ),
                    trailing: Text(
                      repContoller.leaderBoard[index]['Score'].toString(),
                      style: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFEEEEEE)),
                    ),
                    leading: Text(
                      "${index + 1}",
                      style: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFEEEEEE)),
                    ),
                  ),
                ),
              );
            },
            itemCount: repContoller.leaderBoard.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 7,
            ),
          );
        }));
  }
}
