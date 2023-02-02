import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class RepController extends GetxController {
  static var rep = <int>[0, 0].obs;
  final leaderBoard = <Map>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  getData() async {
    FirebaseFirestore.instance
        .collection("UserData")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map data = {"Name": doc["name"], "Score": doc["score"]};
        leaderBoard.add(data);
        print(leaderBoard);
      }
    });
  }
}
