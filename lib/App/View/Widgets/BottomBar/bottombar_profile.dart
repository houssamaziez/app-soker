import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tomlogin/App/Model/user.dart';

import '../../Home/Box/screenbox.dart';
import '../../Home/State/stateScreen.dart';
import '../../Home/Profile/profileScreen.dart';
import '../../Home/screenListTime.dart';
import '../../Home/هnsulinConfirmationScreen.dart';

class HomeBOTTONBAR extends StatefulWidget {
  const HomeBOTTONBAR({super.key});

  @override
  State<HomeBOTTONBAR> createState() => _HomeBOTTONBARState();
}

class _HomeBOTTONBARState extends State<HomeBOTTONBAR> {
  int _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.medication_liquid,
    Icons.bar_chart,
    Icons.medical_information,
    Icons.person,
  ];
  final listscreen = [
    ScreenBox(),
    ScreenState(),
    InsulinConfirmationScreen(),
    UserProfileScreen(
      userData: UserData(
          user: User(
              createdAt: "2024",
              email: "nameofuser@gmail.com",
              name: "Name Of User",
              id: 1279832329928,
              updatedAt: "2026",
              wilaya: "batna"),
          message: "",
          status: true,
          token: ""),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listscreen[_bottomNavIndex], //destination screen
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.send_to_mobile_sharp),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(child: Text(' Send Confirmation Successful')),
                content: SizedBox(
                  height: 140,
                  child: Column(
                    children: [
                      Icon(
                        Icons.done,
                        color: Colors.green,
                        size: 100,
                      ),
                      Text('The adjustments have been successfully confirmed.'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      // Close the confirmation screen
                    },
                  ),
                ],
              );
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              222.0), // Change this value to adjust the radius
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          activeColor: Colors.teal,
          borderColor: Colors.teal),
    );
  }
}
