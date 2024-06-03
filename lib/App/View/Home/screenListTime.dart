import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:tomlogin/App/util/Time/temtext.dart';

import '../../Controller/myappcontroller.dart';
import '../../Model/box.dart';

class ScreenListTime extends StatelessWidget {
  const ScreenListTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: _ScreenListTimeStateful(),
    );
  }
}

class _ScreenListTimeStateful extends StatefulWidget {
  @override
  State<_ScreenListTimeStateful> createState() => _ScreenListTimeState();
}

class _ScreenListTimeState extends State<_ScreenListTimeStateful> {
  @override
  Widget build(BuildContext context) {
    var timeProvider = Provider.of<TimeProvider>(context);

    var listchnae = [
      Changestate(
        isselct: timeProvider.switchValue1,
        onChanged: (bool value) {
          timeProvider.switchValue1 = value;
        },
      ),
      Changestate(
        isselct: timeProvider.switchValue2,
        onChanged: (bool value) {
          timeProvider.switchValue2 = value;
        },
      ),
      Changestate(
        isselct: timeProvider.switchValue3,
        onChanged: (bool value) {
          timeProvider.switchValue3 = value;
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("All Time"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: listbox.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              timeProvider.time = listbox[index].time;
              edite(context,
                  box: listbox[index], chnae: listchnae[index], index: index);
            },
            child: Container(
              child: boxwidget(
                box: listbox[index],
                isselct: listchnae[index].isselct,
                onChanged: listchnae[index].onChanged,
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> edite(BuildContext context,
      {required Box box, required Changestate chnae, required int index}) {
    var timeProvider = Provider.of<TimeProvider>(context, listen: false);

    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    boxwidgetedite(
                      box: box,
                      index: index,
                      isselct: chnae.isselct,
                      onChanged: (newValue) {
                        setState(() {
                          chnae.onChanged!(newValue);
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
            Text(
              timeconfig(box.time),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
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

  void updateSecondBox(Box box, index) {
    // Update the second item in the list
    if (listbox.length > 1) {
      setState(() {
        listbox[index] = box;
      });

      // Show a Snackbar to confirm the update
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Updated Box 2'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Padding boxwidgetedite({
    required Box box,
    required bool isselct,
    required int index,
    required Function(bool)? onChanged,
  }) {
    var titleController = TextEditingController(text: box.title);
    var detailsController = TextEditingController(text: box.details);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<TimeProvider>(
        builder: (context, timeProvider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    showPicker(
                      showSecondSelector: true,
                      context: context,
                      value: timeProvider.time,
                      onChange: (newTime) {
                        timeProvider.updateTime(newTime);
                      },
                      minuteInterval: TimePickerInterval.FIVE,
                      onChangeDateTime: (dateTime) {
                        debugPrint("[debug datetime]: $dateTime");
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      timeconfig(timeProvider.time),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Icon(Icons.edit),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (newValue) {
                    // Update title in box
                    // box.title = newValue;
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: detailsController,
                  decoration: InputDecoration(
                    labelText: 'Details',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (newValue) {
                    // Update details in box
                    // box.details = newValue;
                  },
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    updateSecondBox(
                      Box(
                        title: titleController.text,
                        details: detailsController.text,
                        time: timeProvider.time,
                      ),
                      index,
                    );
                    Navigator.of(context).pop(); // Close the bottom sheet
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
