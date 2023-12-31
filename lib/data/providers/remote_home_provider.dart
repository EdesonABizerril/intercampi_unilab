import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteHomeProvider {
  Future<String> loadTips() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("others").get();
      return snapshot.docs.first.data()["home"];
    } catch (e) {
      rethrow;
    }
  }
}
