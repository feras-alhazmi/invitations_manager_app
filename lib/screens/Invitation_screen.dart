import 'package:dash_invitation_app/exports.dart';
import 'package:dash_invitation_app/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  _InvitationScreenState createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  List<Map<String, dynamic>> invitations = [
    {
      "to": "Ahmed",
      "location": "Abha",
      "date": DateTime(2022, 03, 12),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    },
    {
      "to": "SARA",
      "location": "riyadh",
      "date": DateTime(2022, 11, 24),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    },
    {
      "to": "Ahmed",
      "location": "Abha",
      "date": DateTime(2022, 03, 12),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    },
    {
      "to": "SARA",
      "location": "riyadh",
      "date": DateTime(2022, 11, 24),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    },
    {
      "to": "Ahmed",
      "location": "Abha",
      "date": DateTime(2022, 03, 12),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    },
    {
      "to": "SARA",
      "location": "riyadh",
      "date": DateTime(2022, 11, 24),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    },
    {
      "to": "Ahmed",
      "location": "Abha",
      "date": DateTime(2022, 03, 12),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    },
    {
      "to": "SARA",
      "location": "riyadh",
      "date": DateTime(2022, 11, 24),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    },
    {
      "to": "Ahmed",
      "location": "Abha",
      "date": DateTime(2022, 03, 12),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    },
    {
      "to": "SARA",
      "location": "riyadh",
      "date": DateTime(2022, 11, 24),
      "content":
          "Dear Ahmed,\nI hope you doing well\nit’s a pleasure to meet you on 25-Feb in Abha city",
      "regards": "Your friend Dash!\nBest regards",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.fromLTRB(8, 54, 8, 8),
      child: ClipRRect(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xffDFE6E8),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: Row(
                        children: [
                          // Gap(12),
                          Container(
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/dash_manager.png"),
                              radius: 50,
                              backgroundColor: Color(0xffDFE6E8),
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff19879C).withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          const Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome, Dash!",
                                style: Widgets().textStyle(22, Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Gap(2.5),
                              Text("You Can Manage Your invitation now!",
                                  style: Widgets().textStyle(
                                      12, const Color(0xff4B2A2A),
                                      fontWeight: FontWeight.w500)),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 12, 12),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xffB9D800),
                                ),
                              ),
                              const Gap(5),
                              Text("12 Visited You Done",
                                  style: Widgets().textStyle(
                                      12, const Color(0xff96A922),
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xffA90641),
                                ),
                              ),
                              const Gap(5),
                              Text("10 Invitation Created",
                                  style: Widgets().textStyle(
                                      12, const Color(0xffB15C7B),
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "My Invitations",
                  style: Widgets().textStyle(14, const Color(0xff7A7A7A),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: GridView.builder(
                        physics: const ScrollPhysics(),
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 16, top: 12),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: invitations.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 120,
                          crossAxisCount: 2,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          DateTime date = invitations[index]["date"];

                          return Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffC2D1E4),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(MdiIcons.mapMarkerCheck,
                                              color: Color(0xffA90641)),
                                          Text(
                                            invitations[index]["location"],
                                            style: Widgets().textStyle(
                                                12, const Color(0xff7A7A7A),
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 1, horizontal: 8),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff1C9DB6),
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            )),
                                        child: Text(
                                          Jiffy(date).MMMd,
                                          style: Widgets().textStyle(
                                              12, Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    )),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    invitations[index]["to"]
                                        .toString()
                                        .toUpperCase(),
                                    style: Widgets().textStyle(16, Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xff1C9DB6),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Text(
                                            "Tab for more details",
                                            style: Widgets().textStyle(
                                                12, Colors.white,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
