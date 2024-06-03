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

List<Box> listbox = [
  Box(
    title: 'Box 1',
    details: 'details of time',
    time: Time(hour: 11, minute: 30, second: 20),
  ),
  Box(
    title: 'Box 2',
    details: 'details of time',
    time: Time(hour: 11, minute: 30, second: 20),
  ),
  Box(
    title: 'Box 3',
    details: 'details of time',
    time: Time(hour: 11, minute: 30, second: 20),
  ),
];
