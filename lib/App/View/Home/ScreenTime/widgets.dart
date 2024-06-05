import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controller/myappcontroller.dart';
import '../../../Model/box.dart';
import '../../../util/Time/temtext.dart';

Future<dynamic> edite(BuildContext context, {required Widget widget}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    scrollControlDisabledMaxHeightRatio: 300,
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return widget;
          },
        ),
      );
    },
  );
}

Padding boxwidget({
  required Box box,
}) {
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
                  const SizedBox(width: 10),
                ],
              ),
              leading: const Icon(Icons.timer),
              subtitle: Text(box.details),
              trailing: Text(
                timeconfig(box.time),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              // trailing: Switch(value: isselct, onChanged: onChanged),
            ),
          ),
        ],
      ),
    ),
  );
}

List<Box> returnlist(index) {
  if (index == 1) {
    return listbox1;
  } else {
    if (index == 2) {
      return listbox2;
    } else {
      return listbox3;
    }
  }
}
