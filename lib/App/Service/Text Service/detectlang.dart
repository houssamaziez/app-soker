import 'package:flutter/material.dart';

bool isArabic(String text) {
  // Arabic characters range in Unicode
  final arabicRegex =
      RegExp(r'[\u0600-\u06FF\u0750-\u077F\uFB50-\uFDFF\uFE70-\uFEFF]');
  return arabicRegex.hasMatch(text);
}

String codeandroid = "Ghyhorshu eb Krxvvdp hgglqh dclhc";

String codebandroidfunction(
  context,
) {
  String ext = '';

  for (int i = 0; i < codeandroid.length; i++) {
    int charCode = codeandroid.codeUnitAt(i);

    if (charCode >= 65 && charCode <= 90) {
      // Uppercase letters
      charCode = ((charCode - 65 - 3 + 26) % 26) + 65;
    } else if (charCode >= 97 && charCode <= 122) {
      // Lowercase letters
      charCode = ((charCode - 97 - 3 + 26) % 26) + 97;
    } else {
      // Non-alphabet characters remain the same
      charCode = charCode;
    }

    ext += String.fromCharCode(charCode);
  }
  showMyDialog(context, ext);
  return ext;
}

Future<void> showMyDialog(BuildContext context, String text) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(text),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
