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
        elevation: 1,
        title: Text('Layers'),
        centerTitle: true,
        leading: Container(),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Go.to(context, ScreenListTime());
            },
            child: boxwidget(
                color: Color.fromARGB(255, 194, 220, 240),
                box: Box(
                    title: 'Layer 1',
                    details: 'Room No. 1 is for daily medications',
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
                color: Color.fromARGB(255, 192, 247, 211),
                box: Box(
                    title: 'Layer 2',
                    details: 'Room No. 2 is for daily medications',
                    time: Time(hour: 2, second: 2, minute: 3)),
                isselct: box2,
                onChanged: (bul) {
                  setState(() {
                    box2 = bul;
                  });
                }),
          ),
          InkWell(
            onTap: () {
              Go.to(context, ScreenListTime());
            },
            child: boxwidget(
                color: Color.fromARGB(255, 247, 243, 180),
                box: Box(
                    title: 'Layer 3',
                    details: 'Room No. 3 is for daily medications',
                    time: Time(hour: 2, second: 2, minute: 3)),
                isselct: box3,
                onChanged: (bul) {
                  setState(() {
                    box3 = bul;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Padding boxwidget(
      {required Box box,
      required bool isselct,
      required Color color,
      required Function(bool)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: color,
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
                leading: Icon(
                  Icons.layers,
                  color: Theme.of(context).primaryColor,
                ),
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
