import 'package:advance_ui_sevenlearn/gen/assets.gen.dart';
import 'package:advance_ui_sevenlearn/home.dart';
import 'package:advance_ui_sevenlearn/main.dart';
import 'package:advance_ui_sevenlearn/onBoarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnBoardingPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.img.background.splash.image(fit: BoxFit.cover),
          ),
          Center(
            child: Assets.img.icons.logo.svg(width: 160),
          )
        ],
      ),
    );
  }
}
