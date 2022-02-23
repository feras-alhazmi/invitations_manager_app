import 'dart:async';
import '../exports.dart';

class WarringDialog {
  showWarringDialog(
    String id,
    String title,
    String content,
    BuildContext context,
    String yetText,
    String noText, {
    Function? functionOfYesButton,
    Function? functionOfNoButton,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            title,
            style: CustomTextStyle().textStyle(20, Colors.black),
          ),
          content: Text(
            content,
            style: CustomTextStyle().textStyle(14, Colors.black),
          ),
          actions: [
            functionOfYesButton == null
                ? Container()
                : TextButton(
                    style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      yetText.toUpperCase(),
                      style: CustomTextStyle().textStyle(
                        12,
                        Colors.red.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection("invitations")
                          .doc(id)
                          .delete()
                          .then((value) {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: const Color(0xffEDF0F3),
                                elevation: 0.0,
                                content: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Transform.translate(
                                      offset: const Offset(0, 37.5),
                                      child: Text(
                                        "Deleted Successfully",
                                        style: CustomTextStyle().textStyle(
                                          16,
                                          Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(0, -25),
                                      child: AnimatedCheck(),
                                    )
                                  ],
                                ));
                          },
                        );

                        Timer(
                          const Duration(seconds: 1),
                          () {
                            Utils.setSystemUI(
                                const Color(0xff19879C), Brightness.light);

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const InvitationScreen()),
                                (route) => false);
                          },
                        );
                      });
                    },
                  ),
            functionOfNoButton == null
                ? Container()
                : TextButton(
                    style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.green.shade800,
                    ),
                    child: Text(
                      noText.toUpperCase(),
                      style: CustomTextStyle().textStyle(
                        12,
                        Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
          ],
        );
      },
    );
  }
}
