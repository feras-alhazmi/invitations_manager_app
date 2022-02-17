import 'package:dash_invitation_app/exports.dart';
import 'package:dash_invitation_app/widgets.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  _InvitationScreenState createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets().appbar(),
    );
  }
}
