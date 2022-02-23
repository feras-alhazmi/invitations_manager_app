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


  static Future<String> saveImage( image) async {
    await [Permission.storage].request();
    final dateSaved = DateTime.now().toIso8601String().replaceAll('.', '-').replaceAll(':', '-');
    final name = "InvitationCard_$dateSaved";

    final result = await ImageGallerySaver.saveImage(image,name: name);
    return result["filePath"];
  }


}