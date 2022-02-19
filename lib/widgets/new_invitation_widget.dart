import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

import '../exports.dart';

class NewInvitationWidget extends StatefulWidget {
  const NewInvitationWidget({Key? key}) : super(key: key);

  @override
  _NewInvitationWidgetState createState() => _NewInvitationWidgetState();
}

class _NewInvitationWidgetState extends State<NewInvitationWidget> {
  int _currentStep = 0;

  TextEditingController inviteeNameController = TextEditingController();
  bool inviteeNameValidate = false;

  TextEditingController contentController = TextEditingController();
  bool contentValidate = false;

  DateTime initDate = DateTime(
      DateTime.now().year, DateTime.now().month + 1, DateTime.now().day);

  DateTime newDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Stepper(
            type: StepperType.vertical,
            physics: const ScrollPhysics(),
            currentStep: _currentStep,
            controlsBuilder: (BuildContext context, controlsBuilder) {
              return Container();
            },
            steps: [
              Step(
                title: Text(
                  "Invitee Name",
                  style: CustomTextStyle().textStyle(14, Colors.black),
                ),
                subtitle: Text(
                  "type the name of the person you want to invite",
                  style:
                      CustomTextStyle().textStyle(10, const Color(0xffB9ADAD)),
                ),
                content: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: inviteeNameController,
                          style: CustomTextStyle().textStyle(12, Colors.black),
                          decoration: InputDecoration(
                            errorText: inviteeNameValidate
                                ? "Please Enter the invitee name to continue"
                                : null,
                            hintText: "name",
                            hintStyle:
                                CustomTextStyle().textStyle(12, Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            isDense: true,
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
                                backgroundColor: Color(0xff2A7B4F),
                              ),
                              child: Text(
                                "Next",
                                style: CustomTextStyle()
                                    .textStyle(12, Colors.white),
                              ),
                              // onPressed: continued,
                              onPressed: () {
                                if (inviteeNameController.text.isEmpty) {
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
                isActive: _currentStep == 0,
                state: _currentStep == 0
                    ? StepState.editing
                    : (_currentStep > 0
                        ? StepState.complete
                        : StepState.disabled),
              ),
              Step(
                title: Text(
                  "Content",
                  style: CustomTextStyle().textStyle(14, Colors.black),
                ),
                subtitle: Text(
                  "Enter the invitation content",
                  style:
                      CustomTextStyle().textStyle(10, const Color(0xffB9ADAD)),
                ),
                content: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: contentController,
                          style: CustomTextStyle().textStyle(12, Colors.black),
                          maxLines: 5,
                          decoration: InputDecoration(
                            errorText: contentValidate
                                ? "The content of the invitation is required"
                                : null,
                            hintText: "type your invitation content here",
                            hintStyle:
                                CustomTextStyle().textStyle(12, Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            isDense: true,
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
                                backgroundColor: Color(0xffB6351C),
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
                                backgroundColor: Color(0xff2A7B4F),
                              ),
                              child: Text(
                                "Next",
                                style: CustomTextStyle()
                                    .textStyle(12, Colors.white),
                              ),
                              // onPressed: continued,
                              onPressed: () {
                                if (contentController.text.isEmpty) {
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
                isActive: _currentStep == 1,
                state: _currentStep == 1
                    ? StepState.editing
                    : (_currentStep > 1
                        ? StepState.complete
                        : StepState.disabled),
              ),
              Step(
                title: Text(
                  "Date",
                  style: CustomTextStyle().textStyle(14, Colors.black),
                ),
                subtitle: Text(
                  "Pickup the date of the invitation",
                  style:
                      CustomTextStyle().textStyle(10, const Color(0xffB9ADAD)),
                ),
                content: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: InkWell(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:
                                      const Color(0xffE4C2D1).withOpacity(0.80),
                                ),
                                alignment: Alignment.center,
                                child: Text(Jiffy(newDateTime).yMMMEd,
                                    style: CustomTextStyle()
                                        .textStyle(14, Colors.black)),
                              ),
                              onTap: () async {
                                // TODO: show calender and pass the current date
                                DateTime? date = await showRoundedDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(DateTime.now().year + 5),
                                  initialDate: newDateTime,
                                  background: Colors.transparent,
                                  height: 350,
                                  theme: ThemeData(
                                    shadowColor: Colors.transparent,
                                    primaryColor:
                                        Theme.of(context).backgroundColor,
                                    dialogBackgroundColor: Colors.white,
                                    textTheme: const TextTheme(
                                      caption: TextStyle(color: Colors.black),
                                      subtitle1: TextStyle(color: Colors.black),
                                      bodyText1: TextStyle(color: Colors.black),
                                      bodyText2: TextStyle(color: Colors.black),
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
                                    textStyleMonthYearHeader: const TextStyle(
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
                                    textStyleButtonPositive: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    textStyleButtonNegative: const TextStyle(
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
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                );

                                //TODO: change the current date to the new date and save it to the database

                                if (date != null && date != newDateTime) {
                                  newDateTime = date;
                                }
                                setState(() {});
                              },
                            )),
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
                              // onPressed: continued,
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
                isActive: _currentStep == 2,
                state: _currentStep == 2
                    ? StepState.editing
                    : (_currentStep > 2
                        ? StepState.complete
                        : StepState.disabled),
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

// DateTime? date = await showRoundedDatePicker(
// context: context,
// firstDate: DateTime.parse(e["deadline_date"]),
// lastDate: DateTime(DateTime.now().year + 5),
// initialDate: DateTime.parse(e["deadline_date"]),
// background: Colors.transparent,
// height: 350,
// theme: ThemeData(
// shadowColor: Colors.transparent,
// primaryColor: Theme.of(context).scaffoldBackgroundColor,
// dialogBackgroundColor: Colors.white,
// textTheme: TextTheme(
// caption: TextStyle(color: Colors.black),
// subtitle1: TextStyle(color: Colors.black),
// bodyText1: TextStyle(color: Colors.black),
// bodyText2: TextStyle(color: Colors.black),
// ),
// ),
// textDirection: textDirection,
// styleDatePicker: MaterialRoundedDatePickerStyle(
// colorArrowNext: Colors.black,
// colorArrowPrevious: Colors.black,
// backgroundPicker: Theme.of(context).scaffoldBackgroundColor,
// textStyleDayHeader: TextStyle(
// color: Colors.black,
// ),
// textStyleMonthYearHeader: TextStyle(
// color: Colors.black,
// ),
// textStyleCurrentDayOnCalendar: TextStyle(
// color: Colors.black,
// ),
// textStyleDayButton: TextStyle(color: Colors.black, fontSize: 18),
// textStyleDayOnCalendar: TextStyle(
// color: Colors.black,
// ),
// textStyleButtonPositive: TextStyle(
// color: Colors.black,
// ),
// textStyleButtonNegative: TextStyle(
// color: Colors.black,
// ),
// textStyleYearButton: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
// paddingMonthHeader: EdgeInsets.all(12),
// decorationDateSelected: BoxDecoration(
// color: Theme.of(context).backgroundColor,
// borderRadius: BorderRadius.circular(35),
// ),
// ),
// );
//
// //TODO: change the current date to the new date and save it to the database
//
// if (date != null && date != newDateTime) newDateTime = date;
// },
// )
