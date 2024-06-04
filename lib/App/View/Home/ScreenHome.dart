import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:tomlogin/App/util/Time/temtext.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                timeconfig(_time),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    showPicker(
                      showSecondSelector: true,
                      context: context,
                      value: _time,
                      onChange: onTimeChanged,
                      minuteInterval: TimePickerInterval.FIVE,
                      // Optional onChange to receive value as DateTime
                      onChangeDateTime: (DateTime dateTime) {
                        // print(dateTime);
                        debugPrint("[debug datetime]:  $dateTime");
                      },
                    ),
                  );
                },
                child: const Text(
                  "Open time picker",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
