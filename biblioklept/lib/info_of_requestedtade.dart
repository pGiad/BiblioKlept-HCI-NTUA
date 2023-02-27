import 'package:biblioklept/main.dart';
import 'package:biblioklept/mainpage.dart';
import 'package:biblioklept/qrcodecreation.dart';
import 'package:flutter/material.dart';

class InfoRequestedTradePage extends StatefulWidget {
  late User user;
  InfoRequestedTradePage({Key? key, required this.user}) : super(key: key);

  @override
  _InfoRequestedTradeState createState() => _InfoRequestedTradeState();
}

class _InfoRequestedTradeState extends State<InfoRequestedTradePage> {
  late User currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = widget.user;
  }

  void _deleteReceivedRequest(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Reject Received Request"),
        content: const Text("Are you sure you want to delete this request?"),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 112, 4, 80)),
            child: const Text(
              "Yes",
              style: TextStyle(color: Color.fromARGB(255, 112, 4, 80)),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MainPage(
                  user: currentUser,
                );
              }), (r) {
                return false;
              });
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 112, 4, 80)),
            child: const Text(
              "No",
              style: TextStyle(color: Color.fromARGB(255, 112, 4, 80)),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _approveReceivedRequest(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Approve Received Request"),
        content: const Text("Are you sure you want to approve this request?"),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 112, 4, 80)),
            child: const Text(
              "Yes",
              style: TextStyle(color: Color.fromARGB(255, 112, 4, 80)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        GeneratedQRCodePage(user: currentUser)),
              );
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 112, 4, 80)),
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "No",
              style: TextStyle(color: Color.fromARGB(255, 112, 4, 80)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            toolbarHeight: 100,
            elevation: 0,
            backgroundColor: Colors.transparent,
            bottomOpacity: 0,
            centerTitle: true,
            title: const Text(
              'Trade Details',
              style: TextStyle(
                  color: Color.fromARGB(255, 112, 4, 80),
                  fontSize: 32,
                  fontFamily: 'Langar-Regular'),
            ),
            leading: const BackButton(
              color: Color.fromARGB(255, 112, 4, 80),
            ),
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 40.0),
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
                    const SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _approveReceivedRequest(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 112, 4, 80),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.check),
                              SizedBox(width: 5),
                              Text(
                                "Approve",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _deleteReceivedRequest(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 112, 4, 80),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.cancel),
                              SizedBox(width: 5),
                              Text(
                                "Reject",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
