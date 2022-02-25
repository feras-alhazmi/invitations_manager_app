import 'exports.dart';

Future<void> main() async {
  Utils.setSystemUI(const Color(0xff19879C), Brightness.light);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  initApp();
}
