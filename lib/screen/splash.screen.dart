import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:portfolio_hakimi/constant.dart';
import 'package:portfolio_hakimi/screen/walkthrough.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void Function() get navigatoToWalk => () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const WalkThrough()));
      };

  @override
  void initState() {
    Timer(const Duration(seconds: 3), navigatoToWalk);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Theme.of(context).primaryColor,
              size: 200,
            ),
          ),
          Text(
            'Loading My PortFolio ...',
            style: headerStyle,
          )
        ],
      ),
    );
  }
}
