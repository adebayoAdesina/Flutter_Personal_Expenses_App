import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/Screen/home_screen.dart';
import 'package:personal_expenses/Util/color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: kPrimaryColor,
            onPrimary: kWhiteColor,
            secondary: kSecondaryColor,
            onSecondary: kWhiteColor,
            error: Colors.red,
            onError: Colors.red,
            background: kWhiteColor,
            onBackground: kWhiteColor,
            surface: kPrimaryColor,
            onSurface: kPrimaryColor),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: kPrimaryColor),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
        ),
        primaryColor: kPrimaryColor,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kSecondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
