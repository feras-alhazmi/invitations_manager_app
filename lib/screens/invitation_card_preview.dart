import 'dart:async';

import '../exports.dart';

class InvitationCardPreview extends StatefulWidget {
  final String defaultImagePath;
  final Map<String, dynamic> invitation;

  const InvitationCardPreview(this.defaultImagePath, this.invitation,
      {Key? key})
      : super(key: key);

  @override
  _InvitationCardPreviewState createState() => _InvitationCardPreviewState();
}

class _InvitationCardPreviewState extends State<InvitationCardPreview> {
  Xid xid = Xid();

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
        Icons.save,
        color: Colors.green[900],
        size: 40,
      ),
      "title": "Save",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    Utils.setSystemUI(const Color(0xffEDF0F3), Brightness.dark);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              height: MediaQuery.of(context).size.height * 0.85,
            ),
            Scaffold(
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
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(
                  "Preview Invitation Card",
                  style: CustomTextStyle()
                      .textStyle(18, Colors.white, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                                  ]),
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
                                                widget.invitation["location"],
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
                                                Jiffy(widget.invitation["date"])
                                                    .yMMMd,
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
                                              widget.invitation[
                                                  "welcome_sentence"],
                                              style: CustomTextStyle()
                                                  .textStyle(18, Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            const Gap(3),
                                            Text(
                                              widget.invitation["to"],
                                              style: CustomTextStyle()
                                                  .textStyle(18, Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const Gap(24),
                                        Text(
                                          widget.invitation["content"],
                                          style: CustomTextStyle()
                                              .textStyle(16, Colors.black),
                                        ),
                                        const Gap(24),
                                        Text(
                                          widget.invitation["regards"],
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
                      Align(
                        alignment: Alignment.center,
                        child: Transform.translate(
                          offset: const Offset(100, -70),
                          child: Image.asset(
                            widget.defaultImagePath,
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
                            height: 133,
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
                                horizontal: 8, vertical: 32),
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
                              Utils.setSystemUI(
                                  const Color(0xff19879C), Brightness.light);

                              Navigator.pop(context);
                            } else {
                              index == 1
                                  ? Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const InvitationScreen()),
                                      (route) => false)
                                  : FirebaseFirestore.instance
                                      .collection("invitations")
                                      .doc(xid.toString())
                                      .set(widget.invitation)
                                      .then((value) {
                                      showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              backgroundColor:
                                                  const Color(0xffEDF0F3),
                                              elevation: 0.0,
                                              content: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Transform.translate(
                                                    offset:
                                                        const Offset(0, 37.5),
                                                    child: Text(
                                                      "Invitation Created Successfully",
                                                      style: CustomTextStyle()
                                                          .textStyle(
                                                        16,
                                                        Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Transform.translate(
                                                    offset:
                                                        const Offset(0, -25),
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
                                              const Color(0xff19879C),
                                              Brightness.light);
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const InvitationScreen()),
                                              (route) => false);
                                        },
                                      );
                                    });
                            }
                          },
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
