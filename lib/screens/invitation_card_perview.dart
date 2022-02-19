import '../exports.dart';

class InvitationCardPerview extends StatefulWidget {
  final Map<String,dynamic> invitation;


  const InvitationCardPerview( this.invitation,{Key? key}) : super(key: key);

  @override
  _InvitationCardPerviewState createState() => _InvitationCardPerviewState();
}

class _InvitationCardPerviewState extends State<InvitationCardPerview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          iconSize: 30,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).backgroundColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
     body: Center(child: Container(
       child: Column(
         children: [
           Text(
             widget.invitation["name"],
             style: CustomTextStyle()
                 .textStyle(12, Colors.black),
           ),
           Text(
             widget.invitation["content"],
             style: CustomTextStyle()
                 .textStyle(12, Colors.black),
           ),
           Text(
             widget.invitation["place"],
             style: CustomTextStyle()
                 .textStyle(12, Colors.black),
           ),
           Text(
             Jiffy(widget.invitation["date"]).yMMMEd,
             style: CustomTextStyle()
                 .textStyle(12, Colors.black),
           ),
           Text(
             widget.invitation["regards"],
             style: CustomTextStyle()
                 .textStyle(12, Colors.black),
           ),
         ],
       ),
     )),
    );
  }
}
