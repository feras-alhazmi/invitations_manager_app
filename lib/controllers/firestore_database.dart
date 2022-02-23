import 'dart:async';

import 'package:dash_invitation_app/exports.dart';



class FirebaseDB {
  Future<void> addInvitation(Map<String,dynamic> invitationContent) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    Xid xid = Xid();

    firebaseFirestore.collection("invitations").doc(xid.toString()).set(invitationContent);

  }


  // Future<void> deleteInvitation(BuildContext context,dynamic id)async {
  //   FirebaseFirestore.instance.collection("invitations").doc(id).delete().then((value){
  //     showDialog(
  //       context: context,
  //       builder: (dialogContext) {
  //         return AnimatedCheck();
  //       },
  //     );
  //     Timer(
  //         Duration(
  //             seconds: 2),
  //             (){
  //           Navigator.of(context).pushAndRemoveUntil(
  //               MaterialPageRoute(
  //                   builder: (context) =>
  //                   const InvitationScreen()),
  //                   (route) => false);
  //         });
  //   });
  //
  // }
}
