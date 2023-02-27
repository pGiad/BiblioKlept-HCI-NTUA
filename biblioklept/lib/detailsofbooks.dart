import 'package:biblioklept/selectbookfortrade.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class BookDetailsPage extends StatefulWidget {
  late User user;
  late Book book;
  BookDetailsPage({Key? key, required this.user, required this.book});

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetailsPage> {
  late SQLiteService sqLiteService;
  late User currentUser;
  late User? _owner = new User();
  late Book currentBook;

  @override
  void initState() {
    super.initState();
    currentUser = widget.user;
    currentBook = widget.book;
    sqLiteService = SQLiteService();
    sqLiteService.initDB().whenComplete(() async {
      final owner = await sqLiteService.getUserById(widget.book.userID!);
      setState(() {
        _owner = owner;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          leading: const BackButton(
            color: Color.fromARGB(255, 112, 4, 80),
          ),
          centerTitle: true,
          title: Text(
            "${currentBook.title}\nfrom ${_owner?.username}",
            style: const TextStyle(
                color: Color.fromARGB(255, 112, 4, 80),
                fontSize: 32,
                fontFamily: 'Langar-Regular'),
            textAlign: TextAlign.center,
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.all(16),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 60.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title: ${currentBook.title}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Divider(thickness: 2, height: 24),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Author: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: currentBook.author)
                                ],
                              ),
                            ),
                            const Divider(thickness: 2, height: 28),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Publisher: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: currentBook.publisher)
                                ],
                              ),
                            ),
                            const Divider(thickness: 2, height: 28),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Summary: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: currentBook.summary)
                                ],
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const Divider(thickness: 2, height: 28),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Number of Pages: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          currentBook.numberofpages.toString())
                                ],
                              ),
                            ),
                            const Divider(thickness: 2, height: 28),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Category: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: currentBook.category)
                                ],
                              ),
                            ),
                            const Divider(thickness: 2, height: 28),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Condition: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: currentBook.condition)
                                ],
                              ),
                            ),
                            const Divider(thickness: 2, height: 28),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Year of Purchase: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          currentBook.yearofpurchase.toString())
                                ],
                              ),
                            ),
                            const Divider(thickness: 2, height: 28),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Owner\'s Address: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: _owner?.address)
                                ],
                              ),
                            ),
                            const Divider(thickness: 2, height: 28),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Owner\'s email: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: _owner?.email)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SelectBookforTrade(user: currentUser)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 112, 4, 80),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              fixedSize: const Size(200, 40)),
                          child: const Text(
                            'Find a Book to Give',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            )));
  }
}
