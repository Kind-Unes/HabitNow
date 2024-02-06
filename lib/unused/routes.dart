// import 'package:flutter/material.dart';
// import 'package:gazakit/src/features/Instructions/instructions.dart';
// import 'package:gazakit/src/features/boycott/boycott.dart';
// import 'package:gazakit/src/features/boycott/boycottt.dart';
// import 'package:gazakit/src/features/duaa/duaa.dart';
// import 'package:gazakit/src/features/encoding/encoding.dart';
// import 'package:gazakit/src/features/socialMediaAccounts.dart/socialMediaAccounts.dart';
// import 'package:gazakit/src/features/statistics/statistics.dart';

// import '../features/comments/comments.dart';
// import '../features/historical/historical.dart';
// import '../features/socialMedia/socialMedia.dart';
// import '../layout/layout.dart';
// class AppRoutes {
//   static const layout = '/';
//   static const duaa = '/duaa';
//   static const boycott = '/boycott';
//   static const social = '/social';
//   static const accounts = '/accounts';
//    static const encoding = '/encoding';
//     static const comments = '/comments';
//         static const historical = '/historical';
//     static const instructions = '/instructions';
//      static const stats = '/stats';
//   Route? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//                case AppRoutes.accounts:
//         return MaterialPageRoute(builder: (context) => const SocialMediaAccountsPage());
//          case AppRoutes.duaa:
//         return MaterialPageRoute(builder: (context) => const DuaaPage());
//           case AppRoutes.stats:
//         return MaterialPageRoute(builder: (context) => const StatisticsPage());
//       case AppRoutes.layout:
//         return MaterialPageRoute(builder: (context) => const Layout());
//       case AppRoutes.boycott:
//         return MaterialPageRoute(builder: (context) => const BotcottPage());
//       case AppRoutes.social:
//         return MaterialPageRoute(builder: (context) => const SocialMedia());
//         case AppRoutes.comments:
//         return MaterialPageRoute(builder: (context) => const CommentsHashtags());
//     case AppRoutes.encoding:
//         return MaterialPageRoute(builder: (context) => const Encoding());
//   case AppRoutes.historical:
//         return MaterialPageRoute(builder: (context) => const HistoricalInformationsPage());
//          case AppRoutes.instructions:
//         return MaterialPageRoute(builder: (context) => const InstructionsPage());
//     }
//     return null;
//   }
// }