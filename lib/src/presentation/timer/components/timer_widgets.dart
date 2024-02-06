import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/timer_cubits/actionButton_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/dialog_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/dialog_state.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_controller_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_controller_state.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_sttate.dart';
import 'package:habit_now/src/cubit/timer_cubits/timer_index_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/timer_index_state.dart';
import 'package:habit_now/src/cubit/timer_cubits/timer_record_cubt.dart';
import 'package:habit_now/src/presentation/shared/bottomSheets.dart';
import 'package:habit_now/src/presentation/shared/dialogMessages.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class TimerAppBar extends StatelessWidget implements PreferredSize {
  @override
  Widget get child => throw UnimplementedError();
  final BuildContext context;

  @override
  Size get preferredSize => Size.fromHeight(context.height * 0.08);
  const TimerAppBar({
    super.key,
    required this.volumeActionButtonCubit,
    required this.vibrateActionButtonCubit,
    required this.context,
  });

  final VolumeActionButtonCubit volumeActionButtonCubit;
  final VibrateActionButtonCubit vibrateActionButtonCubit;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Transform.translate(
          offset: const Offset(-25, 0),
          child: const Text(
            "Timer",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          BlocBuilder<VolumeActionButtonCubit, Color>(
            builder: (context, state) {
              return IconButton(
                onPressed: volumeActionButtonCubit.pressButton,
                icon: const Icon(Icons.vibration_rounded),
                color: state,
                iconSize: Sizes.kActionIcon,
              );
            },
          ),
          BlocBuilder<VibrateActionButtonCubit, Color>(
            builder: (context, volume) {
              return IconButton(
                onPressed: vibrateActionButtonCubit.pressButton,
                icon: const Icon(Icons.volume_up_outlined),
                color: volume,
                iconSize: Sizes.kActionIcon,
              );
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            size: 20,
            color: Color.fromARGB(255, 255, 0, 85),
          ),
        ),
        elevation: 1,
        shadowColor: const Color.fromARGB(255, 122, 115, 115));
  }
}

class HabitDialog extends StatelessWidget {
  const HabitDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
        height: context.height * 0.425,
        width: context.width * 0.8,
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Habit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    Text(
                      "2/2/24",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 56, 56, 56),
          ),
          const Text(
            "00:00",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            "Total time",
            style: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontWeight: FontWeight.normal,
                fontSize: 14),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: context.height * 0.095,
            child: const Row(
              children: [
                PendingButton(),
                DoneButton(),
              ],
            ),
          ),
          SizedBox(
            height: context.height * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DialogExpandedButton(
                  border: const [0, 0, 0, 1],
                  color: AppColors.kBackgroundColor,
                  content: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.speaker_notes_outlined,
                        color: Colors.grey,
                        size: 28,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Save time as note",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  function: () {},
                ),
              ],
            ),
          ),
          DialogExpandedButton(
            border: const [0, 1, 0, 0],
            color: AppColors.kBackgroundColor,
            content: const Center(
              child: Text(
                "CLOSE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            function: () {
              Navigator.of(context).pop();
            },
          )
        ]),
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  const DoneButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DialogExpandedButton(
      border: const [1, 1, 1, 1],
      color: AppColors.kBackgroundColor,
      content: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: context.height * 0.035,
            width: context.height * 0.035,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                color: const Color.fromARGB(255, 46, 46, 46)),
            child: Icon(
              Icons.check,
              size: context.height * 0.027,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Done",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.7)),
          ),
        ]),
      ),
      function: () {},
    );
  }
}

class PendingButton extends StatelessWidget {
  const PendingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DialogExpandedButton(
      border: const [0, 1, 1, 1],
      color: AppColors.kBackgroundColor,
      content: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: context.height * 0.035,
            width: context.height * 0.035,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromARGB(255, 46, 46, 46)),
            child: Icon(
              null,
              size: context.height * 0.027,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 47, 47, 47)),
            child: const Text(
              "Pending",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ]),
      ),
      function: () {},
    );
  }
}

class StopwatchTimer extends StatelessWidget {
  final String time;
  final TimerCubit timerCubit;

  const StopwatchTimer({
    super.key,
    required this.time,
    required this.timerCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return SizedBox(
          height: Sizes.kTimeProgressIdicator,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: Sizes.kTimeProgressIdicator,
                  height: Sizes.kTimeProgressIdicator,
                  child: CircularProgressIndicator(
                    value: 0,
                    backgroundColor:
                        state == const TimerState(Strings.kRunState)
                            ? AppColors.kpurpleOn
                            : AppColors.kpurpleOff,
                    strokeWidth: 14.0,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  time,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TimeWheelPicker extends StatelessWidget {
  const TimeWheelPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeWheel(
          start: 8,
          last: 23,
          function: (dynamic) {},
          text: 'hours',
        ),
        Transform.translate(
          offset: Offset(0, -context.height * 0.02),
          child: const Text(
            ":",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        TimeWheel(
          start: 30,
          last: 59,
          function: (dynamic) {},
          text: 'minutes',
        ),
        Transform.translate(
          offset: Offset(0, -context.height * 0.02),
          child: const Text(
            ":",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        TimeWheel(
          start: 010,
          last: 59,
          function: (dynamic) {},
          text: 'seconds',
        ),
      ],
    );
  }
}

class TimeWheel extends StatelessWidget {
  final int start;
  final int last;
  final Function(dynamic) function;
  final String text;

  const TimeWheel({
    super.key,
    required this.start,
    required this.last,
    required this.function,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: context.height * 0.15,
          width: 80,
          child: Transform.scale(
            scale: 1.3,
            child: WheelChooser(
              startPosition: start,
              onValueChanged: function,
              datas: List.generate(last + 1,
                  (index) => index < 10 ? "0$index" : index.toString()),
            ),
          ),
        ),
        SizedBox(
          height: context.height * 0.03,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.4)),
        )
      ],
    );
  }
}

class TimerRecord extends StatelessWidget {
  const TimerRecord({
    super.key,
    required this.timerRecordCubit,
  });
  final TimerRecordCubit timerRecordCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerRecordCubit, TimerRecordState>(
      builder: (context, state) {
        return Column(
          children: [
            timerRecordCubit.state.state.isSaved
                ? Material(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    color: AppColors.kGray,
                    child: InkWell(
                      onTap: () {
                        context.showBottmSheet(const TimerBottomSheetContent());
                      },
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      child: Container(
                        height: context.height * 0.08,
                        width: context.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          border: Border.all(
                              color: const Color.fromARGB(255, 54, 54, 54)),
                        ),
                        child: Center(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: context.height * 0.05,
                              width: context.height * 0.05,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: const Color.fromARGB(255, 49, 49, 49)),
                              child: Icon(
                                Icons.timer_outlined,
                                size: context.height * 0.04,
                                color: const Color.fromARGB(255, 172, 172, 172),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Last record",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.3),
                                      fontSize: 16),
                                ),
                                Text(
                                  state.state.record,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 19),
                                ),
                              ],
                            ),
                            const Spacer(),
                            BlocBuilder<TimerRecordCubit, TimerRecordState>(
                              builder: (context, state) {
                                return Material(
                                  borderRadius: BorderRadius.circular(500),
                                  color: const Color.fromARGB(255, 49, 49, 49),
                                  child: InkWell(
                                    onTap: () {
                                      timerRecordCubit.updateRecord("", false);
                                      debugPrint(
                                          state.state.isSaved.toString());
                                    },
                                    borderRadius: BorderRadius.circular(500),
                                    child: Container(
                                      height: context.height * 0.05,
                                      width: context.height * 0.05,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(500),
                                      ),
                                      child: Icon(
                                        Icons.close_rounded,
                                        size: context.height * 0.04,
                                        color: const Color.fromARGB(
                                            255, 172, 172, 172),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            )
                          ],
                        )),
                      ),
                    ),
                  )
                : MySubTile(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                    color: AppColors.kGray,
                    textIconColor: AppColors.kMeduimGray,
                    icon: null,
                    text: "No recent records",
                    function: null,
                    isIcon: false,
                    isText: true,
                    size: Size(
                      context.width * 0.9,
                      context.height * 0.08,
                    )),
            MySubTile(
                bottomLeft: const Radius.circular(20),
                bottomRight: const Radius.circular(20),
                topLeft: Radius.zero,
                topRight: Radius.zero,
                color: AppColors.kGray,
                textIconColor: AppColors.kMeduimGray,
                icon: null,
                text: "No activity selected",
                function: () {
                  context.showBottmSheet(const TimerBottomSheetContent());
                },
                isIcon: false,
                isText: true,
                size: Size(
                  context.width * 0.9,
                  context.height * 0.08,
                ))
          ],
        );
      },
    );
  }
}

class TimerDialogMessage extends StatelessWidget {
  const TimerDialogMessage({
    super.key,
    required this.yesFunction,
    required this.noFunction,
  });

  final Function() yesFunction;
  final Function() noFunction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 18.0),
          const Text(
            'Save record?',
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 10.0),
          const Divider(
            color: Color.fromARGB(255, 46, 46, 46),
          ),
          Row(
            children: [
              InkWell(
                onTap: noFunction,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(16)),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(16)),
                  ),
                  width: context.width * 0.398,
                  height: context.height * 0.056,
                  child: const Center(
                      child: Text(
                    "NO",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
                ),
              ),
              InkWell(
                onTap: yesFunction,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(16)),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(16)),
                  ),
                  width: context.width * 0.398,
                  height: context.height * 0.056,
                  child: const Center(
                      child: Text(
                    "YES",
                    style: TextStyle(
                        color: Color.fromARGB(255, 230, 17, 88),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HabitTile extends StatelessWidget {
  const HabitTile({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });
  final Color color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: AppColors.kBackgroundColor,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              context.showDialogMessage(const HabitDialog());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: context.height * 0.05,
                    width: context.height * 0.05,
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(10)),
                    child: Icon(icon),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          color: AppColors.kGray,
        ),
      ],
    );
  }
}

class TimerButtons extends StatelessWidget {
  const TimerButtons({
    super.key,
    required this.timerCubit,
    required this.dialogCubit,
    required this.stopwatchCubit,
    required this.timerRecordCubit,
  });

  final TimerCubit timerCubit;
  final DialogCubit dialogCubit;
  final StopwatchCubit stopwatchCubit;
  final TimerRecordCubit timerRecordCubit;
  void dialogFunction(
      BuildContext context, answer, StopwatchState state) async {
    // Create a Completer to handle the asynchronous completion
    Completer<void> completer = Completer<void>();
    stopwatchCubit.stopStopwatch();
    context.showDialogMessage(TimerDialogMessage(
      yesFunction: () {
        dialogCubit.getAnswer(1);
        stopwatchCubit.resetStopwatch();
        debugPrint(state.formattedTime);
        timerRecordCubit.updateRecord(state.formattedTime, true);

        completer.complete(); // Complete the Future when user presses 'Yes'
      },
      noFunction: () {
        dialogCubit.getAnswer(0);
        stopwatchCubit.resetStopwatch();
        completer.complete(); // Complete the Future when user presses 'No'
      },
    ));

    // Wait for the user's response before proceeding
    await completer.future;

    // Now, you can continue with your logic after the user responds
    if (answer == const DialogState(1)) {
      // Handle 'Yes'
    }
    if (answer == const DialogState(0)) {
      // Handle 'No'
    }
    context.pop();
    timerCubit.pressedStop();
    context.showBottmSheet(const TimerBottomSheetContent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchCubit, StopwatchState>(
      builder: (context, stopwatchstate) {
        return BlocBuilder<DialogCubit, DialogState>(
          builder: (context, answer) {
            return BlocBuilder<TimerCubit, TimerState>(
              builder: (context, timerState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TimerButton(
                        text: "RESUME",
                        icon: Icons.play_arrow,
                        textIconColor: Colors.white,
                        buttonColor: AppColors.kButtonPrimary,
                        function: () {
                          timerCubit.pressedStart();
                          stopwatchCubit.startStopwatch();
                        },
                        isVanish: timerState ==
                            const TimerState(Strings.kPausetState),
                        size: const Size(140.0, 50.0)),
                    TimerButton(
                        text: "START",
                        icon: Icons.play_arrow,
                        textIconColor: Colors.white,
                        buttonColor: AppColors.kButtonPrimary,
                        function: () {
                          timerCubit.pressedStart();
                          stopwatchCubit.startStopwatch();
                        },
                        isVanish:
                            timerState == const TimerState(Strings.kStopState),
                        size: const Size(140.0, 50.0)),
                    TimerButton(
                        text: "PAUSE",
                        icon: Icons.play_arrow,
                        textIconColor: Colors.white,
                        buttonColor: AppColors.kButtonPrimary,
                        function: () {
                          timerCubit.pressedPause();
                          stopwatchCubit.stopStopwatch();
                        },
                        isVanish:
                            timerState == const TimerState(Strings.kRunState),
                        size: const Size(140.0, 50.0)),
                    SizedBox(
                      width: context.width * 0.032,
                    ),
                    TimerButton(
                        text: "STOP",
                        icon: Icons.stop,
                        textIconColor: AppColors.ktextIconPrimary,
                        buttonColor: AppColors.kButtonSecondary,
                        function: () {
                          dialogFunction(context, answer, stopwatchstate);
                        },
                        isVanish: timerState ==
                            const TimerState(Strings.kPausetState),
                        size: const Size(12.0, 50.0)),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

class TimerPageViewController extends StatelessWidget {
  const TimerPageViewController({
    super.key,
    required this.timerPageViewCubit,
  });

  final TimerPageViewCubit timerPageViewCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerPageViewCubit, TimerPageViewState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MySubTile(
              size: Size(context.width * 0.9 / 3, context.height * 0.1),
              bottomLeft: const Radius.circular(20),
              bottomRight: Radius.zero,
              topLeft: const Radius.circular(20),
              topRight: Radius.zero,
              color: state == const TimerPageViewState(1)
                  ? AppColors.kButtonSecondary
                  : AppColors.kGray,
              textIconColor: state == const TimerPageViewState(1)
                  ? AppColors.ktextIconPrimary
                  : AppColors.kMeduimGray,
              icon: Icons.timer_sharp,
              text: "Stopwatch",
              function: () {
                timerPageViewCubit.updateIndex(1);
              },
              isIcon: true,
              isText: true,
            ),
            MySubTile(
              size: Size(context.width * 0.9 / 3, context.height * 0.1),
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
              topLeft: Radius.zero,
              topRight: Radius.zero,
              color: state == const TimerPageViewState(2)
                  ? AppColors.kButtonSecondary
                  : AppColors.kGray,
              textIconColor: state == const TimerPageViewState(2)
                  ? AppColors.ktextIconPrimary
                  : AppColors.kMeduimGray,
              icon: Icons.hourglass_top_sharp,
              text: "Countdown",
              function: () {
                if (context.read<TimerCubit>().state ==
                    const TimerState(Strings.kRunState)) {
                  context.showToast(const ToastWidget(
                    text: 'Timer is running',
                  ));
                } else {
                  timerPageViewCubit.updateIndex(2);
                }
              },
              isIcon: true,
              isText: true,
            ),
            MySubTile(
              size: Size(context.width * 0.9 / 3, context.height * 0.1),
              bottomRight: const Radius.circular(20),
              bottomLeft: Radius.zero,
              topRight: const Radius.circular(20),
              topLeft: Radius.zero,
              color: state == const TimerPageViewState(3)
                  ? AppColors.kButtonSecondary
                  : AppColors.kGray,
              textIconColor: state == const TimerPageViewState(3)
                  ? AppColors.ktextIconPrimary
                  : AppColors.kMeduimGray,
              icon: Icons.incomplete_circle_rounded,
              text: "Intervals",
              function: () {
                if (context.read<TimerCubit>().state ==
                    const TimerState(Strings.kRunState)) {
                  context.showToast(const ToastWidget(
                    text: 'Timer is running',
                  ));
                } else {
                  timerPageViewCubit.updateIndex(3);
                }
              },
              isIcon: true,
              isText: true,
            ),
          ],
        );
      },
    );
  }
}

class ToastWidget extends StatelessWidget {
  const ToastWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }
}

class MySubTile extends StatelessWidget {
  final Radius bottomLeft;
  final Radius bottomRight;
  final Radius topLeft;
  final Radius topRight;
  final Color color;
  final Color textIconColor;
  final IconData? icon;
  final String? text;
  final Function()? function;
  final bool isIcon;
  final bool isText;
  final Size size;

  const MySubTile({
    super.key,
    required this.bottomLeft,
    required this.bottomRight,
    required this.topLeft,
    required this.topRight,
    required this.color,
    required this.textIconColor,
    this.icon,
    this.text,
    this.function,
    required this.isIcon,
    required this.isText,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius raduis = BorderRadius.only(
        topLeft: topLeft,
        bottomLeft: bottomLeft,
        topRight: topRight,
        bottomRight: bottomRight);

    double height = size.height;
    double width = size.width;

    return Material(
      borderRadius: raduis,
      color: color,
      child: InkWell(
        onTap: function,
        borderRadius: raduis,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: raduis,
            border: Border.all(color: const Color.fromARGB(255, 54, 54, 54)),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isIcon
                  ? Icon(
                      icon,
                      size: 32,
                      color: textIconColor,
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 3,
              ),
              isText
                  ? Text(
                      text!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textIconColor),
                    )
                  : const SizedBox(),
            ],
          )),
        ),
      ),
    );
  }
}

class TimerButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color textIconColor;
  final Color buttonColor;
  final Function() function;
  final bool isVanish;
  final Size size;

  const TimerButton({
    super.key,
    required this.text,
    required this.icon,
    required this.textIconColor,
    required this.buttonColor,
    required this.function,
    required this.isVanish,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVanish,
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(size),
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: textIconColor,
              size: 27,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                  color: textIconColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
