import '../exports.dart';

class SettingsScreen extends StatefulWidget {
  final int currentAvatarIndex;
  final int currentImageIndex;

  const SettingsScreen(this.currentAvatarIndex, this.currentImageIndex,
      {Key? key})
      : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> imagesPath = [
    "assets/images/dash_designer-2.png",
    "assets/images/dash_manager-x.png",
    "assets/images/dash_dev-2.png",
  ];
  late int avatarTemp;
  late int cardAvatarTemp;

  @override
  void initState() {
    avatarTemp = widget.currentAvatarIndex;
    cardAvatarTemp = widget.currentImageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 68, 24, 100),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                onPressed: () {
                  Utils.setSystemUI(const Color(0xff19879C), Brightness.light);

                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Dash's Settings",
                style: CustomTextStyle()
                    .textStyle(18, Colors.black, fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "Default Avatar",
                          style: CustomTextStyle().textStyle(
                              14, const Color(0xff7A7A7A),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(imagesPath.length, (index) {
                            return InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 2,
                                      color: avatarTemp == index
                                          ? Theme.of(context)
                                              .scaffoldBackgroundColor
                                          : Colors.transparent,
                                    )),
                                child: Image.asset(
                                  imagesPath[index],
                                  width: (MediaQuery.of(context).size.width -
                                          (MediaQuery.of(context).size.width *
                                              0.10)) *
                                      0.265,
                                  height: (MediaQuery.of(context).size.width -
                                          (MediaQuery.of(context).size.width *
                                              0.10)) *
                                      0.265,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  avatarTemp = index;
                                });
                              },
                            );
                          }),
                        ),
                      ),
                      const Gap(25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "Default Invitation Card Image",
                          style: CustomTextStyle().textStyle(
                              14, const Color(0xff7A7A7A),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(imagesPath.length, (index) {
                            return InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 2,
                                      color: cardAvatarTemp == index
                                          ? Theme.of(context)
                                              .scaffoldBackgroundColor
                                          : Colors.transparent,
                                    )),
                                child: Image.asset(
                                  imagesPath[index],
                                  width: (MediaQuery.of(context).size.width -
                                          (MediaQuery.of(context).size.width *
                                              0.10)) *
                                      0.265,
                                  height: (MediaQuery.of(context).size.width -
                                          (MediaQuery.of(context).size.width *
                                              0.10)) *
                                      0.265,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  cardAvatarTemp = index;
                                });
                              },
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: InkWell(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.green.shade800,
                            ),
                            alignment: Alignment.center,
                            child: Text("Save Changes",
                                style: CustomTextStyle().textStyle(
                                    16, Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                          onTap: () async {
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            setState(() {
                              sharedPreferences.setInt(
                                  "avatar_index", avatarTemp);
                              sharedPreferences.setInt(
                                  "image_index", cardAvatarTemp);
                            });
                            Navigator.of(context).pop();
                          },
                        )))
              ],
            )),
      ),
    );
  }
}
