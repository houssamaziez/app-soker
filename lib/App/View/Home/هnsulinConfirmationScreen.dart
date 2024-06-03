import 'package:flutter/material.dart';

class InsulinConfirmationScreen extends StatefulWidget {
  @override
  _InsulinConfirmationScreenState createState() =>
      _InsulinConfirmationScreenState();
}

class _InsulinConfirmationScreenState extends State<InsulinConfirmationScreen> {
  double currentSugarLevel = 180.0;
  double recommendedInsulinDose = 10.0;

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation Successful'),
          content: SizedBox(
            height: 140,
            child: Column(
              children: [
                Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 100,
                ),
                Text('The adjustments have been successfully confirmed.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Close the confirmation screen
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sugar Level Summary:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sugar Level:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 120,
                          child: TextFormField(
                            initialValue: currentSugarLevel.toString(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Sugar Level',
                            ),
                            onChanged: (value) {
                              setState(() {
                                currentSugarLevel =
                                    double.tryParse(value) ?? currentSugarLevel;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommended Insulin Details:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended Dose:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 120,
                          child: TextFormField(
                            initialValue: recommendedInsulinDose.toString(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Insulin Dose',
                            ),
                            onChanged: (value) {
                              setState(() {
                                recommendedInsulinDose =
                                    double.tryParse(value) ??
                                        recommendedInsulinDose;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _showSuccessDialog();
                // Handle confirmation logic here
                // For example, update the insulin dose and navigate back
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Confirm Adjustments',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
