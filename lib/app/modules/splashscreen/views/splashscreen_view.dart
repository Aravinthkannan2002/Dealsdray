
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splashscreen_controller.dart';

 class SplashscreenView extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
     controller.getallinfo();
    return Scaffold(
       body: Center(
                child: Lottie.asset(
                  'assets/Animation - 1721843494037.json',
                  fit: BoxFit.cover,
                ),
              ),
       
    );
  }
}