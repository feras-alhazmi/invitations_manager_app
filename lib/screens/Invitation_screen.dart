import 'package:dash_invitation_app/exports.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  _InvitationScreenState createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {

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
                  color: Colors.white70,
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
                child: Stack(
                  children: [
                    Column(
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Welcome, Dash!",
                                      style: CustomTextStyle().textStyle(
                                          22, Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Gap(2.5),
                                    Text(
                                      "You Can Manage Your invitation now!",
                                      style: CustomTextStyle().textStyle(
                                          12, const Color(0xff4B2A2A),
                                          fontWeight: FontWeight.w500),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 12, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance.collection("invitations").where("date" , isLessThan:  DateTime.now()).snapshots(),
                                    builder: (context,snapshot){
                                      if (snapshot.hasError || snapshot.connectionState ==
                                          ConnectionState.waiting || snapshot.data?.size == 0) {
                                        return Text("- Visited You Done",
                                          style: CustomTextStyle().textStyle(
                                              12, const Color(0xff96A922),
                                              fontWeight: FontWeight.w500),
                                        );
                                      }

                                      return Text("${snapshot.data?.docs.length} Visited You Done",
                                          style: CustomTextStyle().textStyle(
                                              12, const Color(0xff96A922),
                                              fontWeight: FontWeight.w500));
                                    },
                                  ),

                                ],
                              ),
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
                                  StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance.collection("invitations").snapshots(),
                                    builder: (context,snapshot){

                                      if (snapshot.hasError || snapshot.connectionState ==
                                          ConnectionState.waiting || snapshot.data?.size == 0) {
                                        return Text("- Invitation Created",
                                          style: CustomTextStyle().textStyle(
                                              12, const Color(0xffB15C7B),
                                              fontWeight: FontWeight.w500),
                                        );
                                      }
                                      return  Text(
                                          "${snapshot.data?.docs.length} Invitation Created",
                                          style: CustomTextStyle().textStyle(
                                              12, const Color(0xffB15C7B),
                                              fontWeight: FontWeight.w500));
                                    },
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){}, icon: const Icon(Icons.settings),),
                    )
                  ],
                )
              ),
              const Gap(8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "My Invitations",
                  style: CustomTextStyle().textStyle(
                      14, const Color(0xff7A7A7A),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(8),
              Flexible(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("invitations")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "Something went to error!",
                                style: CustomTextStyle().textStyle(
                                    12, const Color(0xff7A7A7A),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.data?.size == 0) {
                          return Center(
                            child: Text(
                              "Don't Start Your First Invitation!",
                              style: CustomTextStyle().textStyle(
                                  12, const Color(0xff7A7A7A),
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        }

                        return GridView(
                          physics: const ScrollPhysics(),
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 16, top: 0),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          // itemCount: docs?.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 140,
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                          ),
                          children: snapshot.data!.docs.map(
                            (DocumentSnapshot document) {
                              Timestamp t = document["date"];
                              DateTime date = t.toDate();
                              // int messageLength = document.get("message").toString().length;

                              return InkWell(
                                  child: Container(
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
                                                const Icon(
                                                  MdiIcons.mapMarkerCheck,
                                                  color: Color(0xffA90641),
                                                ),
                                                Text(
                                                  document["location"],
                                                  style: CustomTextStyle()
                                                      .textStyle(
                                                          12,
                                                          const Color(
                                                              0xff7A7A7A),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1,
                                                      horizontal: 8),
                                              decoration: const BoxDecoration(
                                                color: Color(0xff19879C),
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(15),
                                                  topRight: Radius.circular(15),
                                                ),
                                              ),
                                              child: Text(
                                                Jiffy(date).MMMd,
                                                style: CustomTextStyle()
                                                    .textStyle(12, Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            document["to"]
                                                .toString()
                                                .toUpperCase(),
                                            style: CustomTextStyle().textStyle(
                                                16, Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 8),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 4,
                                                      horizontal: 8),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff19879C),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Text(
                                                    "Tab for more details",
                                                    style: CustomTextStyle()
                                                        .textStyle(
                                                            12, Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                SingleInvitationScreen(
                                                    document))));
                                  });
                            },
                          ).toList(),
                        );
                      })),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (dialogContext) {
                  return NewInvitationWidget();
                },
              );
              // Navigator.push(context, MaterialPageRoute(builder: (context){
              //   return NewInvitationWidget();
              // }));
            },
            child: const Icon(Icons.add, size: 35),
            backgroundColor: const Color(0xff2A7B4F),
          ),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
