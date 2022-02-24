import 'exports.dart';

initApp() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool? isSeen = sharedPreferences.getBool("seen");
  Widget currentScreen;

  if (isSeen == null || isSeen == false) {
    currentScreen = const OnBoardingScreen();
  } else {
    currentScreen = const InvitationScreen();
  }

  runApp(DashInvitationsApp(currentScreen));
}

class DashInvitationsApp extends StatefulWidget {
  final Widget currentScreen;

  const DashInvitationsApp(this.currentScreen, {Key? key}) : super(key: key);

  @override
  _DashInvitationsAppState createState() => _DashInvitationsAppState();
}

class _DashInvitationsAppState extends State<DashInvitationsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invitations Manager App',
      theme: AppTheme.appTheme(),
      debugShowCheckedModeBanner: false,
      home: widget.currentScreen,
    );
  }
}
