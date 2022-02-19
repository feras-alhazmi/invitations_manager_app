import 'package:dash_invitation_app/exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xid/xid.dart';

class FirebaseDB {
  Future<void> addInvitation() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    Xid xid = Xid();

    firebaseFirestore.collection("invitations").doc(xid.toString()).set({
      "to": "SARA",
      "location": "riyadh",
      "date": DateTime(2022, 11, 24),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    }).then((value) {
      print("Added");
    });
  }
}
