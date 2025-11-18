// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_personal_money_app/view/main_screen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();

//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(HomeApp());
// }

// class HomeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Personal Expenses',
//       theme: ThemeData(
//         fontFamily: 'Quicksand',
//         textTheme: ThemeData.light().textTheme.copyWith(
//           titleLarge: TextStyle(
//             fontFamily: 'Quicksand',
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//           labelLarge: TextStyle(
//             color: Colors.deepPurpleAccent,
//           ),
//         ),
//         appBarTheme: AppBarTheme(
//           titleTextStyle: TextStyle(
//             fontFamily: 'Quicksand',
//             fontSize: 22,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//         colorScheme: ColorScheme.fromSwatch(
//           primarySwatch: Colors.deepPurple,
//         ).copyWith(
//           secondary: Colors.deepPurpleAccent,
//         ),
//       ),
//       home: MyApp(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'view/main_screen.dart';

void main() {
  runApp(const PersonalExpenseApp());
}

class PersonalExpenseApp extends StatelessWidget {
  const PersonalExpenseApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }

//   // ...existing code...
// }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expense App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          secondary: Colors.amber,
        ),
        fontFamily: 'Quicksand',
      ),
      home: MyApp(),
    );
  }
}
