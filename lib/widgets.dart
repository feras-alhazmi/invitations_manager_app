import 'package:dash_invitation_app/exports.dart';


class Widgets{


  AppBar appbar({ String? title, TextStyle? textStyle}){


    return AppBar(

      title: title != null ? Text(title,style: textStyle) : null,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

  }


  TextStyle textStyle(double fontSize, Color color, {FontWeight? fontWeight}){


    return GoogleFonts.ubuntu(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }


}