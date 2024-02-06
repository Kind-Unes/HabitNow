import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/timer_cubits/actionButton_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/dialog_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_controller_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/timer_index_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/timer_index_state.dart';
import 'package:habit_now/src/cubit/timer_cubits/timer_record_cubt.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_cubit.dart';
import 'package:habit_now/src/cubit/timer_cubits/stopwatch_sttate.dart';
import 'package:habit_now/src/presentation/timer/components/timer_widgets.dart';
import 'package:habit_now/src/utils/extentions.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Bad Practice (Like that you are forcing a hole widget tree to get rebuilt)
    final VolumeActionButtonCubit volumeActionButtonCubit =
        BlocProvider.of<VolumeActionButtonCubit>(context);

    final VibrateActionButtonCubit vibrateActionButtonCubit =
        BlocProvider.of<VibrateActionButtonCubit>(context);

    final TimerCubit timerCubit = BlocProvider.of<TimerCubit>(context);

    final TimerPageViewCubit timerPageViewCubit =
        BlocProvider.of<TimerPageViewCubit>(context);

    final DialogCubit dialogCubit = BlocProvider.of<DialogCubit>(context);

    final StopwatchCubit stopwatchCubit =
        BlocProvider.of<StopwatchCubit>(context);

    final TimerRecordCubit timerRecordCubit =
        BlocProvider.of<TimerRecordCubit>(context);

    return Scaffold(
      appBar: TimerAppBar(
          context: context,
          volumeActionButtonCubit: volumeActionButtonCubit,
          vibrateActionButtonCubit: vibrateActionButtonCubit),
      body: SingleChildScrollView(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: context.height * 0.05,
          ),
          BlocBuilder<TimerPageViewCubit, TimerPageViewState>(
            builder: (context, index) {
              return BlocBuilder<StopwatchCubit, StopwatchState>(
                builder: (context, state) {
                  return SizedBox(
                      height: context.height * 0.3,
                      width: double.infinity,
                      child: [
                        StopwatchTimer(
                            time: state.formattedTime, timerCubit: timerCubit),
                        const TimeWheelPicker(),
                        StopwatchTimer(
                            time: state.formattedTime, timerCubit: timerCubit),
                      ][index.state - 1]);
                },
              );
            },
          ),
          SizedBox(
            height: context.height * 0.07,
          ),
          TimerButtons(
            timerRecordCubit: timerRecordCubit,
            timerCubit: timerCubit,
            dialogCubit: dialogCubit,
            stopwatchCubit: stopwatchCubit,
          ),
          SizedBox(
            height: context.height * 0.05,
          ),
          TimerPageViewController(
            timerPageViewCubit: timerPageViewCubit,
          ),
          const SizedBox(
            height: 12,
          ),
          TimerRecord(
            timerRecordCubit: timerRecordCubit,
          ),
        ])),
      ),
    );
  }
}
