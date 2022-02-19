
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'exports.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor:Color(0xff19879C),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
