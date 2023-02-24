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
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        centerTitle: true,
        title: const Text(
          'Generated QR Code',
          style: TextStyle(
              color: Color.fromARGB(255, 112, 4, 80),
              fontSize: 32,
              fontFamily: 'Langar-Regular'),
        ),
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
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.save,
                  color: Color.fromARGB(255, 112, 4, 80),
                  size: 35.0,
                ),
                onPressed: () {
                  saveQrCode(context, data);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReceivedRequestsPage()),
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
