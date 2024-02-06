import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  int selectedHour = 0;
  int selectedMinute = 0;
  int selectedSecond = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Picker'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hour picker
            SizedBox(
              height: 100,
              width: 100,
              child: WheelChooser(
                datas: List.generate(24, (index) => index.toString()),
                onValueChanged: (value) {
                  setState(() {
                    selectedHour = int.parse(value);
                  });
                },
              ),
            ),

            // Minute picker
            Expanded(
              child: WheelChooser(
                datas: List.generate(60, (index) => index.toString()),
                onValueChanged: (value) {
                  setState(() {
                    selectedMinute = int.parse(value);
                  });
                },
              ),
            ),

            // Second picker
            Expanded(
              child: WheelChooser(
                datas: List.generate(60, (index) => index.toString()),
                onValueChanged: (value) {
                  setState(() {
                    selectedSecond = int.parse(value);
                  });
                },
              ),
            ),

            // Display selected time
            Text(
              'Selected Time: $selectedHour:$selectedMinute:$selectedSecond',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
