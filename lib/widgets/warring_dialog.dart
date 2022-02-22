import '../exports.dart';

class WarringDialog {
  showWarringDialog(
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
                      //TODO: implement the delete operation
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
