import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../customs/colors.dart';
import '../../customs/sizes.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _controller?.forward();
    _goToSecondScreen();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        height: height(context),
        width: width(context),
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * 0.15),
          child: FadeTransition(
            opacity: _controller!,
            child: ScaleTransition(
              scale: _controller!,
              child: Image.asset(
                'assets/images/logo.jpeg',
              ),
            ),
          ),
        ),
      ),
    );
  }

  _goToSecondScreen() async {
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.offAll(
          () => LoginScreen(),
          transition: Transition.zoom,
        ));
  }
}
