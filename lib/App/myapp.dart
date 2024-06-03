import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tomlogin/App/util/theme/light_theme.dart';

import 'View/Welcome/screenweclom.dart';
import 'View/Widgets/BottomBar/bottombar_profile.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: light,
      // home: userid.read('iduser') == null ? ScreenSignin() : ScreenHome(),
      home: const ScreenWelcome(),
    );
  }
}
