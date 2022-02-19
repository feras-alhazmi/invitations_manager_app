import '../exports.dart';

class InvitationCardPreview extends StatefulWidget {
  final Map<String, dynamic> invitation;

  const InvitationCardPreview(this.invitation, {Key? key}) : super(key: key);

  @override
  _InvitationCardPreviewState createState() => _InvitationCardPreviewState();
}

class _InvitationCardPreviewState extends State<InvitationCardPreview> {
  List<Map<String, dynamic>> buttons = [
    {
      "icon": const Icon(
        Icons.edit,
        size: 35,
        color: Color(0xff7C7C7C),
      ),
      "title": "Edit",
    },
    {
      "icon": Icon(
        Icons.delete,
        color: Color(0xffE50000),
        size: 35,
      ),
      "title": "Delete",
    },
    {
      "icon": Icon(
        Icons.save,
        color: Colors.green[900],
        size: 35,
      ),
      "title": "Save",
    },
  ];

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
        title: Text(
          "Preview Invitation Card",
          style: CustomTextStyle()
              .textStyle(18, Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Gap(68),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffEDF0F3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    MdiIcons.mapMarkerCheck,
                                    color: Color(0xffA90641),
                                    size: 30,
                                  ),
                                  Text(
                                    widget.invitation["place"],
                                    style: CustomTextStyle().textStyle(
                                        14, const Color(0xff7A7A7A),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                height: 35,
                                width: 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xffD1D1D1),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    MdiIcons.calendarCheck,
                                    color: Color(0xffB9D800),
                                    size: 30,
                                  ),
                                  Text(
                                      Jiffy(widget.invitation["date"]).yMMMd,
                                    style: CustomTextStyle().textStyle(
                                        14, const Color(0xff7A7A7A),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Transform.translate(
                  offset: const Offset(120, -60),
                  child: Image.asset(
                    "assets/images/dash_designer.png",
                    width: 250,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          const Gap(12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(buttons.length, (index) {
              return Container(
                height: 130,
                width: 106,
                decoration: BoxDecoration(
                  color: const Color(0xffEDF0F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttons[index]["icon"],
                      const Gap(12),
                      Text(
                        buttons[index]["title"],
                        style: CustomTextStyle().textStyle(18, Colors.black),
                      ),
                    ]),
              );
            }),
          )
        ],
      ),
    );
  }
}
