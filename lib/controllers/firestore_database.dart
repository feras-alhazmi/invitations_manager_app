import 'package:dash_invitation_app/exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xid/xid.dart';

class FirebaseDB {
  Future<void> addInvitation(Map<String,dynamic> invitationContent) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    Xid xid = Xid();

    firebaseFirestore.collection("invitations").doc(xid.toString()).set(invitationContent).then((value) {
      print("Added");
    });
  }
}
