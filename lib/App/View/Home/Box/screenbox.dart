import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:tomlogin/App/View/Home/screenListTime.dart';
import 'package:tomlogin/App/util/Route/go.dart';
import 'package:tomlogin/App/util/Time/temtext.dart';

import '../../../Model/box.dart';

class ScreenBox extends StatefulWidget {
  const ScreenBox({super.key});

  @override
  State<ScreenBox> createState() => _ScreenBoxState();
}

class _ScreenBoxState extends State<ScreenBox> {
  bool box1 = false;
  bool box2 = false;
  bool box3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Go.to(context, ScreenListTime());
            },
            child: boxwidget(
                box: Box(
                    title: 'title',
                    details: 'details',
                    time: Time(hour: 2, second: 2, minute: 3)),
                isselct: box1,
                onChanged: (bul) {
                  setState(() {
                    box1 = bul;
                  });
                }),
          ),
          InkWell(
            onTap: () {
              Go.to(context, ScreenListTime());
            },
            child: boxwidget(
                box: Box(
                    title: 'title',
                    details: 'details',
                    time: Time(hour: 2, second: 2, minute: 3)),
                isselct: true,
                onChanged: (bul) {}),
          ),
          InkWell(
            onTap: () {
              Go.to(context, ScreenListTime());
            },
            child: boxwidget(
                box: Box(
                    title: 'title',
                    details: 'details',
                    time: Time(hour: 2, second: 2, minute: 3)),
                isselct: true,
                onChanged: (bul) {}),
          ),
        ],
      ),
    );
  }

  Padding boxwidget(
      {required Box box,
      required bool isselct,
      required Function(bool)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListTile(
                title: Row(
                  children: [
                    Text(box.title),
                    SizedBox(width: 10),
                  ],
                ),
                leading: Icon(Icons.timer),
                subtitle: Text(box.details),
                trailing: Switch(value: isselct, onChanged: onChanged),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
