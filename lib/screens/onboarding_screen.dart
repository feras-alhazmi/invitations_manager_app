import 'package:shared_preferences/shared_preferences.dart';

import '../exports.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  int temp = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> pages = [
    Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xffEDF0F3),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff19879C).withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/dash_manager.png",
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
            ),
            const Gap(15),
            Text(
              "Hey Dash!",
              style: CustomTextStyle()
                  .textStyle(24, Colors.black, fontWeight: FontWeight.w500),
            ),
            const Gap(5),
            Text(
              "It’s Pleasure to meet you!",
              style: CustomTextStyle().textStyle(
                16,
                Colors.black,
              ),
            ),
            const Gap(15),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: const Color(0xff19879C).withOpacity(0.4),
                        //     spreadRadius: 1,
                        //     blurRadius: 5,
                        //     offset:
                        //         const Offset(0, 0), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Text(
                        "1",
                        style: CustomTextStyle().textStyle(
                          12,
                          const Color(0xffEDF0F3),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Gap(2.5),
                    Text(
                      "Invite New Friend to meet!",
                      style: CustomTextStyle().textStyle(
                        12,
                        Colors.transparent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: const Color(0xff19879C).withOpacity(0.4),
                        //     spreadRadius: 1,
                        //     blurRadius: 5,
                        //     offset:
                        //         const Offset(0, 0), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Text(
                        "1",
                        style: CustomTextStyle().textStyle(
                          12,
                          const Color(0xffEDF0F3),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Gap(2.5),
                    Text(
                      "Invite New Friend to meet!",
                      style: CustomTextStyle().textStyle(
                        12,
                        const Color(0xffEDF0F3),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )),
    Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xffEDF0F3),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff19879C).withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/dash_dev.png",
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
            ),
            const Gap(15),
            Text(
              "No More worry!",
              style: CustomTextStyle()
                  .textStyle(24, Colors.black, fontWeight: FontWeight.w500),
            ),
            const Gap(5),
            Text(
              "We built this app for you to",
              style: CustomTextStyle().textStyle(
                16,
                Colors.black,
              ),
            ),
            const Gap(15),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xffB9D800),
                        borderRadius: BorderRadius.circular(15),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: const Color(0xff19879C).withOpacity(0.4),
                        //     spreadRadius: 1,
                        //     blurRadius: 5,
                        //     offset:
                        //         const Offset(0, 0), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Text(
                        "1",
                        style: CustomTextStyle().textStyle(
                          12,
                          Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Gap(5),
                    Text(
                      "Invite New Friend to meet!",
                      style: CustomTextStyle().textStyle(
                        12,
                        const Color(0xff19879C),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xffA90641),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "2",
                        style: CustomTextStyle().textStyle(
                          12,
                          Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Gap(5),
                    Text(
                      "Mange Your Invitation easy!",
                      style: CustomTextStyle().textStyle(
                        12,
                        const Color(0xff19879C),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.fromLTRB(8, 54, 8, 8),
      child: ClipRRect(
        child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: PageView(
                    controller: _controller,
                    children: List.generate(pages.length, (index) {
                      return pages[index];
                    }),
                    onPageChanged: (value) {
                      setState(() {
                        temp = value;
                      });
                    },
                  ),
                ),
                Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Column(
                      children: [
                        SmoothPageIndicator(
                          controller: _controller,
                          count: 2,
                          axisDirection: Axis.horizontal,
                          effect: const ExpandingDotsEffect(
                            spacing: 4.0,
                            radius: 4.0,
                            dotWidth: 10.0,
                            dotHeight: 8.0,
                            paintStyle: PaintingStyle.fill,
                            strokeWidth: 3.5,
                            dotColor: Color(0xff7A7A7A),
                            activeDotColor: Color(0xff7A7A7A),
                          ),
                        ),
                        const Gap(15),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: InkWell(
                              child: Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Theme.of(context).backgroundColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor
                                            .withOpacity(0.4),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            temp == 0 ? "Move On" : "Start Now",
                                            style: CustomTextStyle().textStyle(
                                                18,
                                                Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      const Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          FontAwesomeIcons.chevronCircleRight,
                                          color: Color(0xff19879C),
                                        ),
                                      )
                                    ],
                                  )),
                              onTap: () {
                                temp == 0
                                    ? _controller.animateToPage(1,
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.linearToEaseOut)
                                    : {updateStatusOfSeen(true)};
                              },
                            ))
                      ],
                    ))
              ],
            )),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  void updateStatusOfSeen(bool seen) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("seen", seen);
  }
}
