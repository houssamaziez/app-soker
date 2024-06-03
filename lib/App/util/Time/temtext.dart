import 'package:day_night_time_picker/lib/state/time.dart';

timeconfig(Time time) {
  return "${time.hour}:${time.minute}:${time.second} ${time.period.name}"
      .toUpperCase();
}
