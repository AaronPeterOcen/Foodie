import 'package:flutter/material.dart';
// import 'package:foodie/screens/categories.dart';
import 'package:foodie/screens/tabs.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 121, 108, 187),
  ),
  textTheme: GoogleFonts.ubuntuTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabScreen(),
    );
  }
}
