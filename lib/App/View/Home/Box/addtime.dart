import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

import '../../../Controller/myappcontroller.dart';
import '../../../Model/box.dart';

class AddItemScreen extends StatefulWidget {
  final int idd;

  const AddItemScreen({super.key, required this.idd});
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  void _saveItem(BuildContext context) {
    final timeProvider = Provider.of<TimeProvider>(context, listen: false);
    final newItem = Box(
      title: titleController.text,
      details: detailsController.text,
      time: timeProvider.time,
    );

    setState(() {});
    Navigator.of(context).pop(); // Close the screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Item'),
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
                    onPressed: () => _saveItem(context),
                    child: Text('Save'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String timeconfig(Time time) {
    return "${time.hour}:${time.minute}:${time.second}";
  }
}
