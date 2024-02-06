import 'package:flutter/material.dart';

class AppColors {
  static const kLightOffGray = Color.fromARGB(255, 80, 79, 79);
  static const kLightOnGray = Color.fromARGB(255, 206, 204, 204);
  static const kMeduimGray = Color.fromARGB(255, 129, 129, 129);
  static const kGray = Color.fromARGB(255, 37, 37, 37);
  static const kDarkGray = Color.fromARGB(255, 17, 17, 17);
  static const kBackgroundColor = Color.fromARGB(255, 17, 17, 17);
  static const kLightPurple = Color.fromARGB(255, 255, 6, 89);
  static const kpurpleOff = Color.fromRGBO(116, 12, 46, 1);
  static const kpurpleOn = Color.fromRGBO(195, 32, 86, 1);
  static const kButtonPrimary = Color.fromARGB(255, 183, 23, 76);
  static const kButtonSecondary = Color.fromARGB(174, 139, 5, 50);
  static const ktextIconPrimary = Color.fromARGB(255, 231, 7, 81);
}

class Fonts {
  static const kPrimaryFont = 'Roboto';
  static const kSecondaryFont = 'Arial';
}

class Sizes {
  static const kActionIcon = 28.0;
  static const kTimeProgressIdicator = 230.0;

  static const kPaddingSmall = 8.0;
  static const kPaddingMedium = 16.0;
  static const kPaddingLarge = 24.0;

  static const kFontSizeSmall = 14.0;
  static const kFontSizeMedium = 16.0;
  static const kFontSizeLarge = 20.0;
}

class Strings {
  static const kRunState = 'RUNNING';
  static const kPausetState = 'PAUSE';
  static const kStopState = 'STOP';
}

class Routes {
  static const kHomeRoute = '/home';
  static const kProfileRoute = '/profile';
}

class APIEndpoints {
  static const kBaseURL = 'https://api.example.com';
  static const kUsersEndpoint = '/users';
}

class Constants {
  static const kMaxRetryAttempts = 3;
  static const kDefaultTimeout = 5000; // in milliseconds
}
