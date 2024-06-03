import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/foundation.dart';

class TimeProvider extends ChangeNotifier {
  bool _switchValue2 = false;
  bool _switchValue3 = false;
  bool _switchValue1 = false;

  bool get switchValue1 => _switchValue1;
  bool get switchValue2 => _switchValue2;
  bool get switchValue3 => _switchValue3;

  set switchValue1(bool value) {
    _switchValue1 = value;
    notifyListeners();
  }

  set switchValue2(bool value) {
    _switchValue2 = value;
    notifyListeners();
  }

  set switchValue3(bool value) {
    _switchValue3 = value;
    notifyListeners();
  }

  Time _time = Time(hour: 11, minute: 30, second: 20);

  Time get time => _time;

  set time(Time newTime) {
    _time = newTime;
    notifyListeners();
  }

  void updateTime(Time newTime) {
    _time = newTime;
    notifyListeners();
  }
}
