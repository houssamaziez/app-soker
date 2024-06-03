import 'package:flutter/material.dart';
import 'package:tomlogin/App/util/QRscane/screenScaneQR.dart';
import 'package:tomlogin/App/util/Route/go.dart';

import '../../View/Widgets/BottomBar/bottombar_profile.dart';

class ScreenBSC extends StatelessWidget {
  const ScreenBSC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose an interior method"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Connect device with enclosure",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.normal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                Go.to(
                  context,
                  QRViewExample(),
                );
              },
              child: Card(
                child: Container(
                  height: 150,
                  child: Center(
                    child: SizedBox(
                      width: 100,
                      child: Image.asset(
                        'assets/images/qr-scan.gif',
                        fit: BoxFit.contain,
                        height: 150,
                        width: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                Go.to(
                  context,
                  HomeBOTTONBAR(),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        child: Image.asset(
                          'assets/images/bluetooth.png',
                          fit: BoxFit.contain,
                          height: 80,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
