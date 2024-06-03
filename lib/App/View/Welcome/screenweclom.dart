import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tomlogin/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:tomlogin/App/View/Welcome/screenstarte.dart';
import 'package:tomlogin/App/util/Route/go.dart';

import '../../util/Image/pathimages.dart';

class ScreenWelcome extends StatefulWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  @override
  State<ScreenWelcome> createState() => _ScreenWelcomeState();
}

class _ScreenWelcomeState extends State<ScreenWelcome> {
  bool iscomplet = false;

  @override
  void initState() {
    super.initState();
    instail();
  }

  instail() {
    Timer(const Duration(seconds: 4), () {
      Go.to(context, TestScreen());
    });
  }

  @override
  void dispose() {
    setState(() {
      iscomplet = false;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              Images.logo,
              height: 200,
            ),
          ),
          if (iscomplet == true)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            )
        ],
      ),
    );
  }
}
