import 'package:flutter/material.dart';

import '../util/List/listof_wilayat.dart';
import '../util/Size/dimensions.dart';

class ControllerLocation extends ChangeNotifier {
  String selectedWilaya = 'Select Wilaya';

  void showWilayaMenu(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: SizeApp.heightmobile(context, size: 0.5),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: wilayasList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Center(
                        child: Text(
                      wilayasList[index],
                      textAlign: TextAlign.start,
                    )),
                    onTap: () {
                      selectedWilaya = wilayasList[index];
                      notifyListeners();
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
