// import 'dart:async';
// import 'dart:developer' as developer;

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// class MyAppController extends ChangeNotifier {


//   Future<void> initConnectivity() async {
//     late ConnectivityResult result;
//     try {
//       result = await connectivity.checkConnectivity();
//     } on PlatformException catch (e) {
//       developer.log('Couldn\'t check connectivity status', error: e);
//       return;
//     }
//     // if (!mounted) {
//     //   return Future.value(null);
//     // }
//     return updateConnectionStatus(result);
//   }

//   Future<void> updateConnectionStatus(ConnectivityResult result) async {
//     connectionStatus = result;
//     notifyListeners();
//   }

//   int pingtime = 999;
//   getping() {
//     PingApp.ping.stream.listen((event) {
//       try {
//         if (event.response!.time!.inMilliseconds > 999) {
//           pingtime = 999;
//           notifyListeners();
//         } else {
//           pingtime = event.response!.time!.inMilliseconds;
//           notifyListeners();
//         }
//       } catch (e) {
//         pingtime = 999;
//         notifyListeners();
//       }
//     });
//   }

//   UserData? userdata;
//   String iscreate = 'iscreate';
//   @override
//   void dispose() {
//     connectivitySubscription.cancel();
//     super.dispose();
//   }

//   void updateData(UserData newData) {
//     userdata = newData;
//     notifyListeners();
//   }

//   ins() {
//     if (userid.read('iduser') == null) {
//     } else {
//       ApiOperation.getuserData(
//         int.parse(userid.read('iduser')),
//       ).then((UserData value) {
//         if (value.status == true) {
//           updateData(value);
//         } else {}
//       });
//     }
//   }
// }
