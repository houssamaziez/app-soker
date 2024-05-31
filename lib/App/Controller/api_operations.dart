import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Model/user.dart';
import '../util/Const/url.dart';
import '../util/math.dart';

class ApiOperation extends ChangeNotifier {
  bool isloadingAuth = false;
  change(bool vule) {
    isloadingAuth = vule;
    notifyListeners();
  }

  Future register(
      {required String name,
      required String email,
      required String wilaya,
      required int phone,
      required String password,
      required BuildContext context}) async {}
  getuserData(
    int userId,
  ) async {}

  Future login(
      {required String email,
      required String password,
      required BuildContext context}) async {}

  @override
  void dispose() {
    isloadingAuth = false;
    notifyListeners();
    super.dispose();
  }

  Future sendEmailConferM(
      {required String email, required BuildContext context}) async {}

  Future updatepassword(
      {required String password,
      required String email,
      required BuildContext context}) async {
    try {} catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
