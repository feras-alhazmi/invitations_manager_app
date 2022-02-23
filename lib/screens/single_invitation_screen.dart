import 'dart:async';

import 'package:dash_invitation_app/exports.dart';
import 'package:dash_invitation_app/widgets/pointers_cliper.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/firestore_database.dart';
import '../widgets/check_animated.dart';

class SingleInvitationScreen extends StatefulWidget {
  final DocumentSnapshot document;

  const SingleInvitationScreen(this.document, {Key? key}) : super(key: key);

  @override
  _SingleInvitationScreenState createState() => _SingleInvitationScreenState();
}

class _SingleInvitationScreenState extends State<SingleInvitationScreen> {
  List<Map<String, dynamic>> buttons = [
    {
      "icon": const Icon(
        Icons.edit,
        size: 40,
        color: Color(0xff7C7C7C),
      ),
      "title": "Edit",
    },
    {
      "icon": const Icon(
        Icons.delete,
        color: Color(0xffE50000),
        size: 40,
      ),
      "title": "Delete",
    },
    {
      "icon": Icon(
        FontAwesomeIcons.solidShareSquare,
        color: Colors.green[900],
        size: 35,
      ),
      "title": "Share",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xffEDF0F3),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timestamp t = widget.document["date"];
    DateTime date = t.toDate();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            height: MediaQuery.of(context).size.height * 0.88,
          ),
          WillPopScope(
            onWillPop: () async {
              // Do something here
              SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  systemNavigationBarColor: Color(0xff19879C),
                  systemNavigationBarIconBrightness: Brightness.light,
                ),
              );
              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
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
                    SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                        systemNavigationBarColor: Color(0xff19879C),
                        systemNavigationBarIconBrightness: Brightness.light,
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  "Invitation Card",
                  style: CustomTextStyle()
                      .textStyle(18, Colors.white, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xffD0DF72)),
                    width: 190,
                    alignment: Alignment.center,
                    child: Text("Create ${Jiffy(date).yMMMMd}",
                        style: CustomTextStyle().textStyle(14, Colors.black)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xffA90641)),
                    width: 190,
                    alignment: Alignment.center,
                    child: Text("Updated ${Jiffy(date).yMMMMd}",
                        style: CustomTextStyle().textStyle(14, Colors.white)),
                  ),
                  const Gap(8),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                            width: double.infinity,
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
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 24),
                                      child: Align(
                                        alignment: Alignment.topLeft,
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
                                                  style: CustomTextStyle()
                                                      .textStyle(
                                                    14,
                                                    const Color(0xff7A7A7A),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
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
                                                  style: CustomTextStyle()
                                                      .textStyle(
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
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Gap(100),
                                          Row(
                                            children: [
                                              Text(
                                                widget.document[
                                                    "welcome_sentence"],
                                                style: CustomTextStyle()
                                                    .textStyle(18, Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              const Gap(3),
                                              Text(
                                                widget.document["to"],
                                                style: CustomTextStyle()
                                                    .textStyle(18, Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
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
                                          Text(
                                            widget.document["regards"],
                                            style: CustomTextStyle()
                                                .textStyle(16, Colors.black),
                                          ),
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
                      Align(
                        alignment: Alignment.center,
                        child: Transform.translate(
                          offset: const Offset(100, -70),
                          child: Image.asset(
                            "assets/images/dash_designer-2.png",
                            width: 300,
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(buttons.length, (index) {
                        return InkWell(
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.28,
                            decoration: BoxDecoration(
                                color: const Color(0xffEDF0F3),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      offset: const Offset(0, 0),
                                      spreadRadius: 2,
                                      blurRadius: 2)
                                ]),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buttons[index]["icon"],
                                  const Spacer(),
                                  Text(
                                    buttons[index]["title"],
                                    style: CustomTextStyle()
                                        .textStyle(20, Colors.black),
                                  ),
                                ]),
                          ),
                          onTap: () {
                            if (index == 0) {
                              SystemChrome.setSystemUIOverlayStyle(
                                const SystemUiOverlayStyle(
                                  systemNavigationBarColor: Color(0xff19879C),
                                  systemNavigationBarIconBrightness:
                                      Brightness.dark,
                                ),
                              );
                              Navigator.pop(context);
                            } else {
                              index == 1
                                  ? WarringDialog().showWarringDialog(
                                      widget.document.id,
                                      "Are Your Sure?",
                                      "You can't restore this card anymore it's will be destroyed",
                                      context,
                                      "Delete",
                                      "Keep it",
                                      functionOfYesButton: () {},
                                      functionOfNoButton: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const InvitationScreen()),
                                          (route) => false);
                                    })
                                  : {};
                            }
                          },
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}