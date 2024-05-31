import 'package:flutter/material.dart';
import 'package:tomlogin/App/util/QRscane/screenScaneQR.dart';
import 'package:tomlogin/App/util/Route/go.dart';

class ScreenBSC extends StatelessWidget {
  const ScreenBSC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Connect",
            style: TextStyle(
              color: Colors.amber,
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
                  width: double.infinity,
                  child: Image.asset('assets/images/qr-scan.gif'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
