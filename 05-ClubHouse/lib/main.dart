import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/ui/colors.dart';
import 'package:untitled1/ui/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Palette.background,
          appBarTheme: const AppBarTheme(backgroundColor: Palette.background),
          scaffoldBackgroundColor: Palette.background,
          colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Palette.green,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: GoogleFonts.montserratTextTheme()),
      home: const HomeScreen(),
    );
  }
}
