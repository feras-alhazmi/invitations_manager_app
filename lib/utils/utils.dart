import '../exports.dart';

class Utils{


  static setSystemUI(Color sysNavBarColor,Brightness sysNavBarIconBrightness){
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
        systemNavigationBarColor: sysNavBarColor,
        systemNavigationBarIconBrightness: sysNavBarIconBrightness,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }


}