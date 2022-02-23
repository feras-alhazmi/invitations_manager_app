import 'dart:async';

import 'package:dash_invitation_app/exports.dart';


class SaveInvitationCardScreen extends StatefulWidget {
  final DocumentSnapshot document;

  const SaveInvitationCardScreen(this.document, {Key? key}) : super(key: key);

  @override
  _SaveInvitationCardScreenState createState() =>
      _SaveInvitationCardScreenState();
}

class _SaveInvitationCardScreenState extends State<SaveInvitationCardScreen> {
  late DateTime date;

  @override
  void initState() {

    Utils.setSystemUI( Colors.red, Brightness.dark);

    super.initState();

    Timestamp t = widget.document["date"];
    date = t.toDate();
  }
  final screenShopController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Do something here
        Utils.setSystemUI(const Color(0xffEDF0F3), Brightness.dark);

        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).backgroundColor,
              ),
              onPressed: () {
                Utils.setSystemUI(const Color(0xffEDF0F3), Brightness.dark);

                Navigator.pop(context);
              },
            ),
            centerTitle: true,
          ),
          body: Stack(
           children: [
             Screenshot(
               controller: screenShopController,
               child:Container(
                 color: Theme.of(context).scaffoldBackgroundColor,
                 margin: const EdgeInsets.only(bottom: 100),
                 child: Stack(
                   children: [
                     Align(
                       alignment: Alignment.center,
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(10),
                           child: ClipPath(
                             clipper: PointsClipper(),
                             child: Container(
                               decoration: BoxDecoration(
                                 color: const Color(0xffEDF0F3),
                                 borderRadius: BorderRadius.circular(10),
                                 boxShadow: [
                                   BoxShadow(
                                       color: Colors.black.withOpacity(0.15),
                                       offset: const Offset(0, 0),
                                       spreadRadius: 2,
                                       blurRadius: 2)
                                 ],
                               ),
                               padding: const EdgeInsets.symmetric(
                                   horizontal: 8, vertical: 12),
                               child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   Align(
                                     alignment: Alignment.topLeft,
                                     child: Container(
                                       padding: const EdgeInsets.symmetric(vertical: 8),
                                       margin: const EdgeInsets.symmetric(
                                           vertical: 4, horizontal: 0),
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(15),
                                           color: Colors.transparent,
                                           border: Border.all(
                                             color: Color(0xffA90641),
                                           )),
                                       width: 130,
                                       height: 33,
                                       alignment: Alignment.center,
                                       child: Text(
                                         "Invitation Card",
                                         style: CustomTextStyle().textStyle(
                                             14, Color(0xffA90641),
                                             fontWeight: FontWeight.w500),
                                         textScaleFactor: 1.0,
                                       ),
                                     ),
                                   ),
                                   Align(
                                     alignment: Alignment.topLeft,
                                     child: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         const Gap(30),
                                         Row(
                                           children: [
                                             Text(
                                               widget.document["welcome_sentence"],
                                               style: CustomTextStyle().textStyle(
                                                   18, Colors.black,
                                                   fontWeight: FontWeight.w500),
                                             ),
                                             const Gap(3),
                                             Text(
                                               widget.document["to"],
                                               style: CustomTextStyle().textStyle(
                                                   18, Colors.black,
                                                   fontWeight: FontWeight.w500),
                                             ),
                                           ],
                                         ),
                                         const Gap(24),
                                         Text(
                                           widget.document["content"],
                                           style: CustomTextStyle()
                                               .textStyle(16, Colors.black),
                                         ),
                                         const Gap(24),
                                         Padding(
                                           padding:
                                           const EdgeInsets.symmetric(vertical: 24),
                                           child: Align(
                                             alignment: Alignment.center,
                                             child: Row(
                                               mainAxisSize: MainAxisSize.min,
                                               crossAxisAlignment:
                                               CrossAxisAlignment.center,
                                               mainAxisAlignment:
                                               MainAxisAlignment.center,
                                               children: [
                                                 Column(
                                                   mainAxisAlignment:
                                                   MainAxisAlignment.center,
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment.center,
                                                   mainAxisSize: MainAxisSize.min,
                                                   children: [
                                                     const Icon(
                                                       MdiIcons.mapMarkerCheck,
                                                       color: Color(0xffA90641),
                                                       size: 30,
                                                     ),
                                                     Text(
                                                       widget.document["location"],
                                                       style:
                                                       CustomTextStyle().textStyle(
                                                         14,
                                                         const Color(0xff7A7A7A),
                                                       ),
                                                     )
                                                   ],
                                                 ),
                                                 Container(
                                                   margin: const EdgeInsets.symmetric(
                                                       horizontal: 12),
                                                   height: 35,
                                                   width: 2,
                                                   decoration: BoxDecoration(
                                                     borderRadius:
                                                     BorderRadius.circular(5),
                                                     color: const Color(0xffD1D1D1),
                                                   ),
                                                 ),
                                                 Column(
                                                   mainAxisAlignment:
                                                   MainAxisAlignment.center,
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment.center,
                                                   mainAxisSize: MainAxisSize.min,
                                                   children: [
                                                     const Icon(
                                                       MdiIcons.calendarCheck,
                                                       color: Color(0xffB9D800),
                                                       size: 30,
                                                     ),
                                                     Text(
                                                       Jiffy(date).yMMMd,
                                                       style:
                                                       CustomTextStyle().textStyle(
                                                         14,
                                                         const Color(0xff7A7A7A),
                                                       ),
                                                     )
                                                   ],
                                                 )
                                               ],
                                             ),
                                           ),
                                         ),
                                         const Gap(24),
                                         Text(
                                           widget.document["regards"],
                                           style: CustomTextStyle()
                                               .textStyle(16, Colors.black),
                                         ),
                                         const Gap(32),
                                       ],
                                     ),
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                     ),
                     Hero(
                       tag: widget.document.id,
                       child: Align(
                         alignment: Alignment.center,
                         child: Transform.translate(
                           offset: const Offset(110, 150),
                           child: Image.asset(
                             "assets/images/dash_designer-2.png",
                             width: 300,
                             height: 260,
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
             Align(alignment: Alignment.bottomCenter,child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 42,horizontal: 12),
               child:InkWell(
                 highlightColor: Colors.transparent,
                 child: Container(
                   height: 40,
                   padding:
                   const EdgeInsets.symmetric(vertical: 8),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(25),
                     color: Theme.of(context).backgroundColor,
                   ),
                   alignment: Alignment.center,
                   child: Text("Save as image",
                       style: CustomTextStyle()
                           .textStyle(18, Theme.of(context).scaffoldBackgroundColor,fontWeight: FontWeight.w500)),
                 ),
                 onTap: ()async{
                   final image = await screenShopController.capture();
                   await Utils.saveImage(image).then((value){
                     showDialog(
                       context: context,
                       builder: (dialogContext) {
                         return AlertDialog(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10),
                             ),
                             backgroundColor: const Color(0xffEDF0F3),
                             elevation: 0.0,
                             content: Stack(
                               alignment: Alignment.center,
                               children: [
                                 Transform.translate(
                                   offset: const Offset(0, 37.5),
                                   child: Text(
                                     "Saved as image Successfully",
                                     style: CustomTextStyle().textStyle(
                                       16,
                                       Colors.black,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                                 Transform.translate(
                                   offset: const Offset(0, -25),
                                   child: AnimatedCheck(),
                                 )
                               ],
                             ));
                       },
                     );

                     Timer(
                       const Duration(seconds: 1),
                           () {
                         Utils.setSystemUI(
                             const Color(0xff19879C), Brightness.light);

                         Navigator.of(context).pushAndRemoveUntil(
                             MaterialPageRoute(
                                 builder: (context) =>
                                 const InvitationScreen()),
                                 (route) => false);
                       },
                     );

                   });
                 },
               )
             )),

           ],
          ),
      ),
    );
  }

}
