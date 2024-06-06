import 'package:day_night_time_picker/day_night_time_picker.dart';

class Box {
  final String title;
  final String details;
  final Time time;
  Box({
    required this.title,
    required this.details,
    required this.time,
  });
}

class Changestate {
  final bool isselct;
  final Function(bool)? onChanged;

  Changestate({required this.isselct, required this.onChanged});
}

List<Box> listbox1 = [
  Box(
    title: 'الدواء الاول',
    details: 'معلومات كيفية تناول الدواء',
    time: Time(hour: 1, minute: 45, second: 20),
  ),
  Box(
    title: 'الدواء الثاني',
    details: 'معلومات كيفية تناول الدواء',
    time: Time(hour: 5, minute: 25, second: 20),
  ),
  Box(
    title: 'الدواء الثالث',
    details: 'معلومات كيفية تناول الدواء',
    time: Time(hour: 7, minute: 30, second: 20),
  ),
];
List<Box> listbox2 = [
  Box(
    title: 'الدواء الاول',
    details: 'معلومات كيفية تناول الدواء',
    time: Time(hour: 11, minute: 30, second: 20),
  ),
  Box(
    title: 'الدواء الثاني',
    details: 'معلومات كيفية تناول الدواء',
    time: Time(hour: 10, minute: 33, second: 40),
  ),
];
List<Box> listbox3 = [
  Box(
    title: 'الدواء الاول',
    details: 'details of time',
    time: Time(hour: 3, minute: 58, second: 22),
  ),
  Box(
    title: 'Box 2',
    details: 'معلومات كيفية تناول الدواء',
    time: Time(hour: 8, minute: 35, second: 43),
  ),
];
