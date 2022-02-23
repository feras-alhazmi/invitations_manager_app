import 'dart:async';

import 'package:dash_invitation_app/exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xid/xid.dart';

import '../widgets/check_animated.dart';

class FirebaseDB {
  Future<void> addInvitation(Map<String,dynamic> invitationContent) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    Xid xid = Xid();

   for(int x = 0 ; x<10 ; x++){
     firebaseFirestore.collection("invitations").doc(x.toString()).set(invitationContent).then((value) {
       print("Added");
     });
   }
  }


  Future<void> deleteInvitation(BuildContext context,dynamic id)async {
    FirebaseFirestore.instance.collection("invitations").doc(id).delete().then((value){
      showDialog(
        context: context,
        builder: (dialogContext) {
          return AnimatedCheck();
        },
      );
      Timer(
          Duration(
              seconds: 2),
              (){
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                    const InvitationScreen()),
                    (route) => false);
          });
    });

  }
}
