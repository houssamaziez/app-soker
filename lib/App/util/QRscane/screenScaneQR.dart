import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tomlogin/App/View/Home/ScreenHome.dart';
import 'package:tomlogin/App/View/Home/screenListTime.dart';
import 'package:tomlogin/App/View/Widgets/dialoganimtion.dart';
import 'package:tomlogin/App/util/Route/go.dart';

import '../../View/Widgets/BottomBar/bottombar_profile.dart';

class QRViewExample extends StatefulWidget {
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    controller!.stopCamera();
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scane QR to connect'),
        actions: [
          TextButton(
              onPressed: () {
                controller?.dispose();
                controller!.stopCamera();
                animationController?.dispose();
                Go.push(
                  HomeBOTTONBAR(),
                );
              },
              child: Text("skip"))
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300,
            ),
          ),
          AnimatedBuilder(
            animation: animationController!,
            builder: (context, child) {
              return Positioned(
                top: MediaQuery.of(context).size.height / 2 -
                    204 +
                    (300 * animationController!.value),
                left: MediaQuery.of(context).size.width / 2 - 146,
                child: Container(
                  width: 292,
                  height: 2,
                  color: Colors.red,
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: qrText != null ? Colors.green : Colors.white,
              child: Text(
                qrText != null ? 'Result: $qrText' : 'Scan a code',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      Go.to(
        context,
        HomeBOTTONBAR(),
      );
      showAnimatedDialog(context);
    });
  }
}
