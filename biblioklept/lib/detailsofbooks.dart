import 'package:biblioklept/selectbookfortrade.dart';
import 'package:flutter/material.dart';

class BiblioKlept extends StatelessWidget {
  const BiblioKlept({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiblioKlept',
      home: BookDetailsPage(
          title: 'Davinci Code',
          username: "johnli7",
          author: "",
          publisher: "",
          summary: "",
          pages: hashCode,
          category: "",
          condition: "",
          year: hashCode,
          address: "",
          email: ""),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  final String title;
  final String username;
  final String author;
  final String publisher;
  final String summary;
  final int pages;
  final String category;
  final String condition;
  final int year;
  final String address;
  final String email;

  const BookDetailsPage({
    super.key,
    required this.title,
    required this.username,
    required this.author,
    required this.publisher,
    required this.summary,
    required this.pages,
    required this.category,
    required this.condition,
    required this.year,
    required this.address,
    required this.email,
  });

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
            "$title\nfrom $username",
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
                              'Title: $title',
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
                                  TextSpan(text: author)
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
                                  TextSpan(text: publisher)
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
                                  TextSpan(text: summary)
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
                                  TextSpan(text: pages.toString())
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
                                  TextSpan(text: category)
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
                                  TextSpan(text: condition)
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
                                  TextSpan(text: year.toString())
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
                                  TextSpan(text: address)
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
                                  TextSpan(text: email)
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
                                      const SelectBookforTrade()),
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
