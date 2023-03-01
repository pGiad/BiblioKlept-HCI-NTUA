import 'package:biblioklept/main.dart';
import 'package:biblioklept/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class ScanQRPage extends StatefulWidget {
  late User user;
  ScanQRPage({Key? key, required this.user}) : super(key: key);

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

  late User currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          centerTitle: true,
          title: const Text(
            'Scan QR Code',
            style: TextStyle(
                color: Color.fromARGB(255, 112, 4, 80),
                fontSize: 30,
                fontFamily: 'Langar-Regular'),
          ),
          leading: BackButton(
            color: const Color.fromARGB(255, 112, 4, 80),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MainPage(
                        user: currentUser,
                      );
                    }), (r) {
                      return false;
                    });
                  },
                  child: const Icon(
                    Icons.home,
                    size: 26.0,
                    color: Color.fromARGB(255, 112, 4, 80),
                  ),
                ))
          ],
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact Details:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Full Name: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                          TextSpan(text: "Jane Doe")
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Email: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                          TextSpan(text: "jane.doe@example.come")
                        ],
                      ),
                    ),
                    const Divider(thickness: 2, height: 50),
                    const Text(
                      'Book Details:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Title: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                          TextSpan(text: "Harry Potter")
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Author: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                          TextSpan(text: "Author Name")
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                        onVerticalDragEnd: (details) {
                          if (details.primaryVelocity! < 0) {
                            HapticFeedback.heavyImpact();

                            _scanQRCode();
                          }
                        },
                        child: Center(
                          child: Container(
                            height: 250,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 112, 4, 80),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color.fromARGB(255, 112, 4, 80),
                                  const Color.fromARGB(255, 112, 4, 80),
                                  Color.fromARGB(100, 112, 4, 80),
                                  Color.fromARGB(100, 112, 4, 80),
                                ],
                                stops: [
                                  0.0,
                                  0.1,
                                  0.9,
                                  1.0,
                                ],
                              ),
                            ),
                            child: Center(
                                child: Column(
                              children: const [
                                SizedBox(height: 7),
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10),
                                Icon(
                                  Icons.qr_code_2,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                SizedBox(height: 10),
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                              ],
                            )),
                          ),
                        ))
                  ],
                ),
              ),
            )));
  }
}
