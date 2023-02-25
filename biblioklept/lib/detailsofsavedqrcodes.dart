import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeDetailsPage extends StatelessWidget {
  const QRCodeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          leading: const BackButton(
            color: Color.fromARGB(255, 112, 4, 80),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    int count = 0;
                    Navigator.popUntil(context, (route) {
                      return count++ == 3;
                    });
                  },
                  child: const Icon(
                    Icons.home,
                    size: 26.0,
                    color: Color.fromARGB(255, 112, 4, 80),
                  ),
                ))
          ],
          centerTitle: true,
          title: const Text(
            "Request Details",
            style: TextStyle(
                color: Color.fromARGB(255, 112, 4, 80),
                fontSize: 30,
                fontFamily: 'Langar-Regular'),
            textAlign: TextAlign.center,
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          child: QrImage(
                            data: 'qr code data',
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        ),
                      ),
                      const Divider(height: 30.0),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Contact Information',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Full name: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "Pan Giad")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Email: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "pgiad@gmail.com")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Phone Number: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "6969696969")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Address: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "Katexaki 42")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Preferred Date to Meet: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "25/2/2023 10.45")
                          ],
                        ),
                      ),
                      const Divider(height: 30.0),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Book Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Title: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "Harry Poter")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Author: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "JR Kolkin")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Publisher: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "Symmetria")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Summary: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod tortor mi, a volutpat quam vestibulum non. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam semper velit at orci auctor, eget pharetra velit rutrum. Duis vel interdum quam. Sed porttitor ante eu lacus sodales, at facilisis justo semper. Fusce lacinia viverra sapien, eu venenatis augue convallis sit amet. Sed sed risus eleifend")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Number of Pages: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "3092")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Category: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "Fantasy")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Condition: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "Old")
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Year of Purchase: ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "1990")
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
