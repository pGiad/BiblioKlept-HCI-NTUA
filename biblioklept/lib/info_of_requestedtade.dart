import 'package:biblioklept/qrcodecreation.dart';
import 'package:flutter/material.dart';
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
      home: InfoRequestedTradePage(),
    );
  }
}

class InfoRequestedTradePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Fullname:'),
            SizedBox(height: 4.0),
            Text('Email:'),
            SizedBox(height: 4.0),
            Text('Phone Number:'),
            SizedBox(height: 4.0),
            Text('Address:'),
            SizedBox(height: 4.0),
            Text('Preferred Date to Meet:'),
            SizedBox(height: 16.0),
            Text(
              'Book Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Title:'),
            SizedBox(height: 4.0),
            Text('Author:'),
            SizedBox(height: 4.0),
            Text('Publisher:'),
            SizedBox(height: 4.0),
            Text('Summary:'),
            SizedBox(height: 4.0),
            Text('Number of Pages:'),
            SizedBox(height: 4.0),
            Text('Category:'),
            SizedBox(height: 4.0),
            Text('Condition:'),
            SizedBox(height: 4.0),
            Text('Year of purchase:'),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GeneratedQRCodePage()),
                    );
                  },
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 32.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                            " Are you sure you want to delete this request  ?"),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 112, 4, 80)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReceivedRequestsPage()),
                              );
                            },
                          ),
                          TextButton(
                            child: const Text(
                              "No",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 112, 4, 80)),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: 32.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
