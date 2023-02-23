import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import "package:biblioklept/receivedrequests.dart";

void main() {
  runApp(const BiblioKlept());
}

class BiblioKlept extends StatelessWidget {
  const BiblioKlept({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BiblioKlept',
      home: GeneratedQRCodePage(),
    );
  }
}

class GeneratedQRCodePage extends StatelessWidget {
  const GeneratedQRCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate a random string to encode in the QR code
    String data = DateTime.now().toIso8601String();

    return Scaffold(
      appBar: AppBar(
        title: Text('Generated QR code'),
        centerTitle: true,
      ),
      body: Center(
        child: QrImage(
          data: data,
          version: QrVersions.auto,
          size: 300.0,
          gapless: false,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  saveQrCode(context, data);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReceivedRequestsPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to save the QR code image to the device's photo gallery
  void saveQrCode(BuildContext context, String data) async {
    // Generate the QR code image as a Uint8List
    final qrCode = QrImage(
      data: data,
      version: QrVersions.auto,
      size: 300.0,
      gapless: false,
    );
    // final qrCodeImageData =
    //     await qrCode.toByteData(format: ImageByteFormat.png);

    // // Save the QR code image to the device's photo gallery
    // final result =
    //     await ImageGallerySaver.saveImage(qrCodeImageData!.buffer.asUint8List());
    // if (result['isSuccess']) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('QR code saved to photo gallery')),
    //   );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Failed to save QR code')),
    //   );
    // }
  }
}
