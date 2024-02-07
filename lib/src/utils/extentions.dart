import 'package:flutter/material.dart';
import 'package:habit_now/src/presentation/shared/dialogMessages.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

//? added for test
// extension TextExtention on TextStyle {
//   static const TextStyle textStyle = TextStyle(
//     color: Colors.black,
//     fontSize: 16.0,
//     fontWeight: FontWeight.normal,
//   );

//   // Extension to modify the color
//   TextStyle get withCustomColor {
//     return textStyle.copyWith(color: Colors.red);
//   }

//   TextStyle get withCustomFontWeight {
//     return textStyle.copyWith(color: Colors.red);
//   }

//   // Extension to modify the font size
//   TextStyle get withCustomFontSize {
//     return textStyle.copyWith(fontSize: 20.0);
//   }

//   // Add more extensions as needed
// }

extension StringExtension on String {
  String get capitalize {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get capitalizeFirstofEach {
    return split(" ").map((str) => str.capitalize).join(" ");
  }
}

extension PushNamed on BuildContext {
  void pushNamed(
    String route, {
    TaskModel? arguments,
  }) {
    Navigator.pushNamed(
      this,
      route,
      arguments: arguments,
    );
  }
}

extension DefaultFontSize on BuildContext {
  double get fontSize => MediaQuery.of(this).size.height * 0.0235;
}

extension Pop on BuildContext {
  void pop() {
    Navigator.pop(this);
  }
}

extension ShowDatePicker on BuildContext {
  Future<DateTime?> showDatePickerDialog() {
    final unes = showDatePicker(
        context: this,
        firstDate: DateTime(2024),
        lastDate: DateTime(3000),
        currentDate: DateTime.now());

    return unes;
  }
}

extension PushReplacement on BuildContext {
  void pushReplacementNamed(String route) {
    Navigator.pushReplacementNamed(this, route);
  }
}

extension PushAndRemoveUntil on BuildContext {
  void pushNamedAndRemoveUntil(String route) {
    Navigator.pushNamedAndRemoveUntil(
      this,
      route,
      (route) => false,
    );
  }
}

extension ShowModalBottomSheet on BuildContext {
  void showBottmSheet(Widget content) {
    showModalBottomSheet(
      backgroundColor: AppColors.kBackgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0), // Adjust the top radius as needed
      )),
      context: this,
      builder: (BuildContext context) {
        return content;
      },
    );
  }
}

extension ShowDialogExtension on BuildContext {
  void showDialogMessage(Widget content) {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return content;
      },
    );
  }
}

extension ShowToast on BuildContext {
  void showToast(Widget content) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: content,
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      padding: const EdgeInsets.all(15),
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.symmetric(
          vertical: height * 0.11, horizontal: width * 0.25),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery {
    return MediaQuery.of(this);
  }
}

extension SizeExtension on BuildContext {
  Size get size {
    return MediaQuery.of(this).size;
  }
}

extension WidthExtension on BuildContext {
  double get width {
    return MediaQuery.of(this).size.width;
  }
}

extension HeightExtension on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
}

extension FucusOff on BuildContext {
  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}

extension GetArgs on BuildContext {
  T getArgs<T>() {
    final data =
        ModalRoute.of(this)!.settings.arguments as Map<String, dynamic>;
    return data[data] as T;
  }
}

extension OrientationExtension on BuildContext {
  Orientation get orientation {
    return MediaQuery.of(this).orientation;
  }
}
