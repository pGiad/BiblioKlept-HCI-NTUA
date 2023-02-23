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
    return MaterialApp(
      title: 'BiblioKlept',
      home: QRCodeDetailsPage(),
    );
  }
}

class QRCodeDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // QR Code Image Section
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerRight,
              child: QrImage(
                data: 'qr code data', // TODO: replace with actual QR code data
                version: QrVersions.auto,
                size: 300.0,
              ),
            ),
          ),
          Divider(height: 1.0), // line separator
          // Contact Information Section
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('Fullname: John Doe'),
                  Text('Email: johndoe@gmail.com'),
                  Text('Address: 123 Main St.'),
                  Text('Phone Number: (123) 456-7890'),
                  Text('Preferred Date to Meet: 2023-02-28'),
                ],
              ),
            ),
          ),
          Divider(height: 1.0), // line separator
          // Book Details Section
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Book Details',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('Title: The Great Gatsby'),
                  Text('Author: F. Scott Fitzgerald'),
                  Text('Publisher: Scribner'),
                  Text('Summary: Lorem ipsum dolor sit amet...'),
                  Text('Number of Pages: 218'),
                  Text('Category: Fiction'),
                  Text('Condition: Like New'),
                  Text('Year of Purchase: 2022'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
