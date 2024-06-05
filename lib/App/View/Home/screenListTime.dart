import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:tomlogin/App/View/Home/Box/addtime.dart';
import 'package:tomlogin/App/util/Route/go.dart';
import 'package:tomlogin/App/util/Time/temtext.dart';

import '../../Controller/myappcontroller.dart';
import '../../Model/box.dart';
import 'ScreenTime/widgets.dart';

class ScreenListTime extends StatelessWidget {
  const ScreenListTime({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return _ScreenListTimeStateful(
      id: id,
    );
  }
}

class _ScreenListTimeStateful extends StatefulWidget {
  final int id;

  const _ScreenListTimeStateful({super.key, required this.id});
  @override
  State<_ScreenListTimeStateful> createState() => _ScreenListTimeState(id: id);
}

class _ScreenListTimeState extends State<_ScreenListTimeStateful> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final int id;

  _ScreenListTimeState({required this.id});
  void _saveItem(BuildContext context) {
    final timeProvider = Provider.of<TimeProvider>(context, listen: false);
    final newItem = Box(
      title: titleController.text,
      details: detailsController.text,
      time: timeProvider.time,
    );
    if (listbox1 == 1) {
      listbox1.add(newItem);
    } else {
      if (listbox1 == 2) {
        listbox2.add(newItem);
      } else {
        listbox3.add(newItem);
      }
    }

    setState(() {});
    Navigator.of(context).pop(); // Close the screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
            onPressed: () {},
            icon: IconButton(
                onPressed: () {
                  edite(context, widget: newMethod());

                  // var c = Go.to(context, AddItemScreen());
                  // setState(() {});
                },
                icon: const Icon(Icons.add))),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: const Text("All Time"),
      ),
      body: ListView.builder(
        itemCount: returnlist(id).length,
        itemBuilder: (context, index) {
          return Consumer<TimeProvider>(builder: (context, timeProvidesr, _) {
            return InkWell(
              onTap: () {
                Provider.of<TimeProvider>(context, listen: false)
                    .updateTime(returnlist(id)[index].time);
                edite(context,
                    widget: boxwidgetedite(
                      box: returnlist(id)[index],
                      index: index,
                    ));
              },
              child: Container(
                child: boxwidget(
                  box: returnlist(id)[index],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  newMethod() => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add New Item'),
            elevation: 1,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<TimeProvider>(
              builder: (context, timeProvider, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                        ),
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
                      ),
                    ),
                    SizedBox(height: 20),
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
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _saveItem(context);
                          titleController.clear();
                          detailsController.clear();
                        },
                        child: Text('Save'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

  void updateSecondBox(Box box, index, innexbox) {
    // Update the second item in the list
    if (true) {
      setState(() {
        if (innexbox == 1) {
          listbox1[index] = box;
        } else {
          if (innexbox == 2) {
            listbox2[index] = box;
          } else {
            listbox3[index] = box;
          }
        }
      });
      // Show a Snackbar to confirm the update
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Updated Box 2'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  boxwidgetedite({
    required Box box,
    required int index,
  }) {
    var titleController = TextEditingController(text: box.title);
    var detailsController = TextEditingController(text: box.details);

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Scaffold(
        floatingActionButton:
            Consumer<TimeProvider>(builder: (context, timeProvider, _) {
          return FloatingActionButton(onPressed: () {
            print(box.time);
            timeProvider.updateTime(box.time);
          });
        }),
        appBar: AppBar(
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<TimeProvider>(
            builder: (context, timeProvider, _) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      timeProvider.updateTime(box.time);

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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              // timeconfig(timeProvider.time),
                              'Click to change the time',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            const Icon(Icons.edit),
                          ],
                        ),
                        Text(
                          // timeconfig(timeProvider.time),
                          timeconfig(timeProvider.time),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        // Update title in box
                        // box.title = newValue;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: detailsController,
                      decoration: const InputDecoration(
                        labelText: 'Details',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        // Update details in box
                        // box.details = newValue;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
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
                            id);
                        Navigator.of(context).pop(); // Close the bottom sheet
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Time? timeitem;
