import 'exports.dart';

Future<void> main() async {
  Utils.setSystemUI(const Color(0xff19879C), Brightness.light);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invitations Manager App',
      theme: AppTheme.appTheme(),
      debugShowCheckedModeBanner: false,
      home: const InvitationScreen(),
    );
  }
}
