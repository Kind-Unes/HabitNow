import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_now/src/utils/const.dart';

// get know more about this sh*t
class AppTheme {
  // LightMode Theme Data
  static ThemeData light() {
    return ThemeData(
        elevatedButtonTheme: AppTheme.elevatedButtonThemeData,
        radioTheme: radioThemeData,
        // textTheme: AppTheme.lightTextTheme,
        brightness: Brightness.dark,
        useMaterial3: false,
        appBarTheme: AppTheme.appBarTheme,
        iconTheme: const IconThemeData(),
        iconButtonTheme: const IconButtonThemeData(),
        scaffoldBackgroundColor: AppColors.kBackgroundColor,
        // switchTheme: switchThemeData
        
        );
  }

  // DarkMode Theme Data
  static ThemeData dark() {
    return ThemeData(
      elevatedButtonTheme: AppTheme.elevatedButtonThemeData,
      textTheme: AppTheme.lightTextTheme,
      brightness: Brightness.dark,
      useMaterial3: false,
      appBarTheme: AppTheme.appBarTheme,
      iconTheme: const IconThemeData(),
      iconButtonTheme: const IconButtonThemeData(),
      scaffoldBackgroundColor: AppColors.kBackgroundColor,
    );
  }

  static SwitchThemeData switchThemeData = const SwitchThemeData(
      trackOutlineColor: MaterialStatePropertyAll(AppColors.kLightPurple),
      overlayColor: MaterialStatePropertyAll(AppColors.kLightPurple),
      trackColor: MaterialStatePropertyAll(AppColors.kLightPurple),
      thumbColor: MaterialStatePropertyAll(AppColors.kLightPurple));

  // AppBar Theme
  static AppBarTheme appBarTheme = const AppBarTheme(
      backgroundColor: AppColors.kBackgroundColor,
      actionsIconTheme: IconThemeData(),
      iconTheme: IconThemeData(),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ));

  // Radio
  static RadioThemeData radioThemeData = const RadioThemeData(
      visualDensity: VisualDensity.comfortable,
      fillColor: MaterialStatePropertyAll(
        AppColors.kLightPurple,
      ),
      overlayColor: MaterialStatePropertyAll(AppColors.kLightPurple));

  // ElevatedButton Theme
  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(AppColors.kpurpleOn),
      foregroundColor: MaterialStateProperty.all<Color>(AppColors.kpurpleOn),
      elevation: MaterialStateProperty.all<double>(3.0),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      minimumSize: MaterialStateProperty.all<Size>(const Size(2, 1)),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );

  // IconButton Theme
  static IconButtonThemeData iconButtonTheme = const IconButtonThemeData();

  // Icons Theme
  static IconThemeData iconTheme = const IconThemeData();

  // Text Theme
  static TextTheme lightTextTheme = const TextTheme(
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 60,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
        fontSize: 200, fontWeight: FontWeight.bold, color: Colors.white),
    bodyMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );

  static Color getSoftText(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.7);

  static Color getTextColorOnBackground(Brightness brightness) =>
      brightness == Brightness.light ? Colors.white : Colors.white;
}
