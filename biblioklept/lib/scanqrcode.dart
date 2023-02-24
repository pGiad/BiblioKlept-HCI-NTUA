import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(const BiblioKlept());
}

class BiblioKlept extends StatelessWidget {
  const BiblioKlept({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiblioKlept',
      home: ScanQRPage(),
    );
  }
}

class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  String _qrCode = '';

  Future<void> _scanQRCode() async {
    String qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#FFA611', 'Cancel', true, ScanMode.QR);
    setState(() {
      _qrCode = qrCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Details:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('Name: Jane Doe'),
            Text('Email: jane.doe@example.com'),
            SizedBox(height: 16),
            Text(
              'Book Details:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('Title: TitleX'),
            Text('Author: AuthorY'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: _scanQRCode,
                  icon: Icon(Icons.camera_alt),
                  tooltip: 'Scan QR Code',
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  tooltip: 'Remove Request',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
