import 'package:dash_invitation_app/exports.dart';

class CustomTextStyle {
  TextStyle textStyle(double fontSize, Color color, {FontWeight? fontWeight}) {
    return GoogleFonts.ubuntu(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
