import '../exports.dart';

class NewInvitationWidget extends StatefulWidget {
  const NewInvitationWidget({Key? key}) : super(key: key);

  @override
  _NewInvitationWidgetState createState() => _NewInvitationWidgetState();
}

class _NewInvitationWidgetState extends State<NewInvitationWidget> {
  int _currentStep = 0;

  TextEditingController welcomeSentenceController = TextEditingController();
  bool welcomeSentenceValidate = false;

  TextEditingController inviteeNameController = TextEditingController();
  bool inviteeNameValidate = false;

  TextEditingController contentController = TextEditingController();
  bool contentValidate = false;

  TextEditingController locationController = TextEditingController();
  bool locationValidate = false;

  TextEditingController regardsController = TextEditingController();
  bool regardsValidate = false;

  DateTime initDate = DateTime(
      DateTime.now().year, DateTime.now().month + 1, DateTime.now().day);

  DateTime newDateTime = DateTime.now();

  @override
  void dispose() {
    inviteeNameController.dispose();
    contentController.dispose();
    locationController.dispose();
    regardsController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> titleSuggestions = [
    {
      "text": "Dear Mr.",
      "color": const Color(0xffDCBD99),
    },
    {
      "text": "Dear Ms.",
      "color": const Color(0xffB9B9B9),
    },
    {
      "text": "Hi there!",
      "color": const Color(0xffC5A8C6),
    },
    {
      "text": "Hi My Friend",
      "color": const Color(0xffC5938C),
    },
    {
      "text": "I hope you doing well",
      "color": const Color(0xffD991AF),
    },
  ];

  List<Map<String, dynamic>> contentSuggestions = [
    {
      "text": "It's a pleasure to",
      "color": const Color(0xffDCBD99),
    },
    {
      "text": "Your are invited to",
      "color": const Color(0xffC5A8C6),
    },
    {
      "text": "hoping for your presence on that day ",
      "color": const Color(0xffB9B9B9),
    },
    {
      "text": "I hope you can come",
      "color": const Color(0xffADC1A5),
    },
  ];

  List<Map<String, dynamic>> regardsSuggestions = [
    {
      "text": "Best Regards,",
      "color": const Color(0xffDCBD99),
    },
    {
      "text": "Best,",
      "color": const Color(0xffB9B9B9),
    },
    {
      "text": "Respectfully,",
      "color": const Color(0xffD991AF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(40),
                  const Divider(color: Colors.black, height: 2),
                  Flexible(
                    child: Stepper(
                      type: StepperType.vertical,
                      physics: const ScrollPhysics(),
                      currentStep: _currentStep,
                      controlsBuilder: (BuildContext context, controlsBuilder) {
                        return Container();
                      },
                      steps: [
                        Step(
                          title: Text(
                            "Welcome Sentence",
                            style:
                                CustomTextStyle().textStyle(14, Colors.black),
                          ),
                          subtitle: Text(
                            "type a welcome sentence to the person you want to invitee",
                            style: CustomTextStyle()
                                .textStyle(10, const Color(0xffB9ADAD)),
                          ),
                          content: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                children: [
                                  Wrap(
                                    children: List.generate(
                                        titleSuggestions.length, (index) {
                                      return InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: titleSuggestions[index]
                                                  ["color"],
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Text(
                                              titleSuggestions[index]["text"],
                                              style: CustomTextStyle()
                                                  .textStyle(12,
                                                      const Color(0xff423C3C))),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            welcomeSentenceController.text =
                                                titleSuggestions[index]["text"];
                                            welcomeSentenceValidate = false;
                                          });
                                        },
                                      );
                                    }).toList(),
                                    spacing: 5,
                                    runSpacing: 5,
                                  ),
                                  const Gap(10),
                                  TextFormField(
                                    controller: welcomeSentenceController,
                                    style: CustomTextStyle()
                                        .textStyle(12, Colors.black),
                                    decoration: InputDecoration(
                                      errorText: welcomeSentenceValidate
                                          ? "Please Enter the invitee name to continue"
                                          : null,
                                      hintText: "type here...",
                                      hintStyle: CustomTextStyle()
                                          .textStyle(12, Colors.grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      isDense: true,
                                    ),
                                    onChanged: (value) {
                                      if (welcomeSentenceController.text
                                              .trim() ==
                                          "") {
                                        setState(() {
                                          welcomeSentenceValidate = true;
                                        });
                                      } else {
                                        setState(() {
                                          welcomeSentenceValidate = false;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              const Color(0xff2A7B4F),
                                        ),
                                        child: Text(
                                          "Next",
                                          style: CustomTextStyle()
                                              .textStyle(12, Colors.white),
                                        ),
                                        // onPressed: continued,
                                        onPressed: () {
                                          if (welcomeSentenceController
                                                  .text.isEmpty ||
                                              welcomeSentenceController.text
                                                      .trim() ==
                                                  "") {
                                            setState(() {
                                              welcomeSentenceValidate = true;
                                            });
                                          } else {
                                            continued();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          isActive: _currentStep == 0,
                          state: _currentStep == 0
                              ? StepState.editing
                              : (_currentStep > 0
                                  ? StepState.complete
                                  : StepState.disabled),
                        ),
                        Step(
                          title: Text(
                            "Invitee Name",
                            style:
                                CustomTextStyle().textStyle(14, Colors.black),
                          ),
                          subtitle: Text(
                            "type the name of the person you want to invite",
                            style: CustomTextStyle()
                                .textStyle(10, const Color(0xffB9ADAD)),
                          ),
                          content: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: inviteeNameController,
                                    minLines: 2,
                                    maxLines: 3,
                                    style: CustomTextStyle()
                                        .textStyle(12, Colors.black),
                                    decoration: InputDecoration(
                                      errorText: inviteeNameValidate
                                          ? "Please Enter the invitee name to continue"
                                          : null,
                                      hintText: "name",
                                      hintStyle: CustomTextStyle()
                                          .textStyle(12, Colors.grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      isDense: true,
                                    ),
                                    onChanged: (value) {
                                      if (inviteeNameController.text.trim() ==
                                          "") {
                                        setState(() {
                                          inviteeNameValidate = true;
                                        });
                                      } else {
                                        setState(() {
                                          inviteeNameValidate = false;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              const Color(0xffB6351C),
                                        ),
                                        child: Text(
                                          "Back",
                                          style: CustomTextStyle()
                                              .textStyle(12, Colors.white),
                                        ),
// onPressed: continued,
                                        onPressed: () {
                                          cancel();
                                        },
                                      ),
                                      const Gap(12),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              const Color(0xff2A7B4F),
                                        ),
                                        child: Text(
                                          "Next",
                                          style: CustomTextStyle()
                                              .textStyle(12, Colors.white),
                                        ),
                                        // onPressed: continued,
                                        onPressed: () {
                                          if (inviteeNameController
                                                  .text.isEmpty ||
                                              inviteeNameController.text
                                                      .trim() ==
                                                  "") {
                                            setState(() {
                                              inviteeNameValidate = true;
                                            });
                                          } else {
                                            continued();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          isActive: _currentStep == 1,
                          state: _currentStep == 1
                              ? StepState.editing
                              : (_currentStep > 1
                                  ? StepState.complete
                                  : StepState.disabled),
                        ),
                        Step(
                          title: Text(
                            "Content",
                            style:
                                CustomTextStyle().textStyle(14, Colors.black),
                          ),
                          subtitle: Text(
                            "Enter the invitation content",
                            style: CustomTextStyle()
                                .textStyle(10, const Color(0xffB9ADAD)),
                          ),
                          content: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                children: [
                                  Wrap(
                                    children: List.generate(
                                        contentSuggestions.length, (index) {
                                      return InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: contentSuggestions[index]
                                                  ["color"],
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Text(
                                              contentSuggestions[index]["text"],
                                              style: CustomTextStyle()
                                                  .textStyle(12,
                                                      const Color(0xff423C3C))),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            contentController.text =
                                                contentSuggestions[index]
                                                    ["text"];
                                            contentValidate = false;
                                          });
                                        },
                                      );
                                    }).toList(),
                                    spacing: 5,
                                    runSpacing: 5,
                                  ),
                                  const Gap(10),
                                  TextFormField(
                                    controller: contentController,
                                    style: CustomTextStyle()
                                        .textStyle(12, Colors.black),
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      errorText: contentValidate
                                          ? "The content of the invitation is required"
                                          : null,
                                      hintText:
                                          "type your invitation content here",
                                      hintStyle: CustomTextStyle()
                                          .textStyle(12, Colors.grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      isDense: true,
                                    ),
                                    onChanged: (value) {
                                      if (contentController.text.trim() == "") {
                                        setState(() {
                                          contentValidate = true;
                                        });
                                      } else {
                                        setState(() {
                                          contentValidate = false;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              const Color(0xffB6351C),
                                        ),
                                        child: Text(
                                          "Back",
                                          style: CustomTextStyle()
                                              .textStyle(12, Colors.white),
                                        ),
                                        // onPressed: continued,
                                        onPressed: () {
                                          cancel();
                                        },
                                      ),
                                      const Gap(12),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              const Color(0xff2A7B4F),
                                        ),
                                        child: Text(
                                          "Next",
                                          style: CustomTextStyle()
                                              .textStyle(12, Colors.white),
                                        ),
                                        // onPressed: continued,
                                        onPressed: () {
                                          if (contentController.text.isEmpty ||
                                              contentController.text.trim() ==
                                                  "") {
                                            setState(() {
                                              contentValidate = true;
                                            });
                                          } else {
                                            continued();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          isActive: _currentStep == 2,
                          state: _currentStep == 2
                              ? StepState.editing
                              : (_currentStep > 2
                                  ? StepState.complete
                                  : StepState.disabled),
                        ),
                        Step(
                          title: Text(
                            "Place",
                            style:
                                CustomTextStyle().textStyle(14, Colors.black),
                          ),
                          subtitle: Text(
                            "type the location",
                            style: CustomTextStyle()
                                .textStyle(10, const Color(0xffB9ADAD)),
                          ),
                          content: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: locationController,
                                  style: CustomTextStyle()
                                      .textStyle(12, Colors.black),
                                  decoration: InputDecoration(
                                    errorText: locationValidate
                                        ? "Please Enter the location of the meeting"
                                        : null,
                                    hintText: "place",
                                    hintStyle: CustomTextStyle()
                                        .textStyle(12, Colors.grey),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    isDense: true,
                                  ),
                                  onChanged: (value) {
                                    if (locationController.text.trim() == "") {
                                      setState(() {
                                        locationValidate = true;
                                      });
                                    } else {
                                      setState(() {
                                        locationValidate = false;
                                      });
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor:
                                            const Color(0xffB6351C),
                                      ),
                                      child: Text(
                                        "Back",
                                        style: CustomTextStyle()
                                            .textStyle(12, Colors.white),
                                      ),
                                      // onPressed: continued,
                                      onPressed: () {
                                        cancel();
                                      },
                                    ),
                                    const Gap(12),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor:
                                            const Color(0xff2A7B4F),
                                      ),
                                      child: Text(
                                        "Next",
                                        style: CustomTextStyle()
                                            .textStyle(12, Colors.white),
                                      ),
                                      // onPressed: continued,
                                      onPressed: () {
                                        if (locationController.text.isEmpty ||
                                            locationController.text.trim() ==
                                                "") {
                                          setState(() {
                                            locationValidate = true;
                                          });
                                        } else {
                                          continued();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          isActive: _currentStep == 3,
                          state: _currentStep == 3
                              ? StepState.editing
                              : (_currentStep > 3
                                  ? StepState.complete
                                  : StepState.disabled),
                        ),
                        Step(
                          title: Text(
                            "Regards",
                            style:
                                CustomTextStyle().textStyle(14, Colors.black),
                          ),
                          subtitle: Text(
                            "type your own signature and regards",
                            style: CustomTextStyle()
                                .textStyle(10, const Color(0xffB9ADAD)),
                          ),
                          content: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                children: [
                                  Wrap(
                                    children: List.generate(
                                        regardsSuggestions.length, (index) {
                                      return InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: regardsSuggestions[index]
                                                  ["color"],
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Text(
                                              regardsSuggestions[index]["text"],
                                              style: CustomTextStyle()
                                                  .textStyle(12,
                                                      const Color(0xff423C3C))),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            regardsController.text =
                                                regardsSuggestions[index]
                                                    ["text"];
                                            regardsValidate = false;
                                          });
                                        },
                                      );
                                    }).toList(),
                                    spacing: 5,
                                    runSpacing: 5,
                                  ),
                                  const Gap(10),
                                  TextFormField(
                                    controller: regardsController,
                                    style: CustomTextStyle()
                                        .textStyle(12, Colors.black),
                                    maxLines: 2,
                                    decoration: InputDecoration(
                                      errorText: regardsValidate
                                          ? "The regards is required"
                                          : null,
                                      hintText: "type your regards here",
                                      hintStyle: CustomTextStyle()
                                          .textStyle(12, Colors.grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      isDense: true,
                                    ),
                                    onChanged: (value) {
                                      if (regardsController.text.trim() == "") {
                                        setState(() {
                                          regardsValidate = true;
                                        });
                                      } else {
                                        setState(() {
                                          regardsValidate = false;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              const Color(0xffB6351C),
                                        ),
                                        child: Text(
                                          "Back",
                                          style: CustomTextStyle()
                                              .textStyle(12, Colors.white),
                                        ),
                                        // onPressed: continued,
                                        onPressed: () {
                                          cancel();
                                        },
                                      ),
                                      const Gap(12),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              const Color(0xff2A7B4F),
                                        ),
                                        child: Text(
                                          "Next",
                                          style: CustomTextStyle()
                                              .textStyle(12, Colors.white),
                                        ),
                                        // onPressed: continued,
                                        onPressed: () {
                                          continued();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          isActive: _currentStep == 4,
                          state: _currentStep == 4
                              ? StepState.editing
                              : (_currentStep > 4
                                  ? StepState.complete
                                  : StepState.disabled),
                        ),
                        Step(
                          title: Text(
                            "Date",
                            style:
                                CustomTextStyle().textStyle(14, Colors.black),
                          ),
                          subtitle: Text(
                            "Pickup the date of the invitation",
                            style: CustomTextStyle()
                                .textStyle(10, const Color(0xffB9ADAD)),
                          ),
                          content: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: InkWell(
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xffE4C2D1)
                                          .withOpacity(0.80),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(Jiffy(newDateTime).yMMMEd,
                                        style: CustomTextStyle()
                                            .textStyle(14, Colors.black)),
                                  ),
                                  onTap: () async {
                                    // TODO: show calender and pass the current date
                                    DateTime? date =
                                        await showRoundedDatePicker(
                                      context: context,
                                      firstDate: newDateTime,
                                      lastDate:
                                          DateTime(DateTime.now().year + 5),
                                      initialDate: newDateTime,
                                      background: Colors.transparent,
                                      height: 350,
                                      theme: ThemeData(
                                        shadowColor: Colors.transparent,
                                        primaryColor:
                                            Theme.of(context).backgroundColor,
                                        dialogBackgroundColor: Colors.white,
                                        textTheme: const TextTheme(
                                          caption:
                                              TextStyle(color: Colors.black),
                                          subtitle1:
                                              TextStyle(color: Colors.black),
                                          bodyText1:
                                              TextStyle(color: Colors.black),
                                          bodyText2:
                                              TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      textDirection: TextDirection.ltr,
                                      styleDatePicker:
                                          MaterialRoundedDatePickerStyle(
                                        colorArrowNext: Colors.black,
                                        colorArrowPrevious: Colors.black,
                                        backgroundPicker:
                                            Theme.of(context).backgroundColor,
                                        textStyleDayHeader: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        textStyleMonthYearHeader:
                                            const TextStyle(
                                          color: Colors.black,
                                        ),
                                        textStyleCurrentDayOnCalendar:
                                            const TextStyle(
                                          color: Colors.black,
                                        ),
                                        textStyleDayButton: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        textStyleDayOnCalendar: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        textStyleButtonPositive:
                                            const TextStyle(
                                          color: Colors.black,
                                        ),
                                        textStyleButtonNegative:
                                            const TextStyle(
                                          color: Colors.black,
                                        ),
                                        textStyleYearButton: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        paddingMonthHeader:
                                            const EdgeInsets.all(12),
                                        decorationDateSelected: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                      ),
                                    );

                                    //TODO: change the current date to the new date and save it to the database

                                    if (date != null && date != newDateTime) {
                                      newDateTime = date;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color(0xffB6351C),
                                    ),
                                    child: Text(
                                      "Back",
                                      style: CustomTextStyle()
                                          .textStyle(12, Colors.white),
                                    ),
                                    onPressed: () {
                                      cancel();
                                    },
                                  ),
                                  const Gap(12),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color(0xff2A7B4F),
                                    ),
                                    child: Text(
                                      "View",
                                      style: CustomTextStyle()
                                          .textStyle(12, Colors.white),
                                    ),
// onPressed: continued,
                                    onPressed: () {
                                      if (regardsController.text.isEmpty ||
                                          regardsController.text.trim() == "") {
                                        setState(() {
                                          regardsValidate = true;
                                        });
                                      } else {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return InvitationCardPreview({
                                            "welcome_sentence":
                                                welcomeSentenceController.text,
                                            "to": inviteeNameController.text,
                                            "content": contentController.text,
                                            "location": locationController.text,
                                            "date": newDateTime,
                                            "regards": regardsController.text,
                                          });
                                        }));
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          isActive: _currentStep == 5,
                          state: _currentStep == 5
                              ? StepState.editing
                              : (_currentStep > 5
                                  ? StepState.complete
                                  : StepState.disabled),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                  child: Text(
                    "New Invitation Card",
                    style: CustomTextStyle().textStyle(18, Colors.black,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 5 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
