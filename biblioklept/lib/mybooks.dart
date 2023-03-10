import 'package:biblioklept/add_new_book.dart';
import 'package:biblioklept/addreview.dart';
import 'package:biblioklept/scanqrcode.dart';
import 'package:flutter/material.dart';
import "package:biblioklept/edit_book_page.dart";
import 'main.dart';

class MyBooksPage extends StatefulWidget {
  late User user;
  MyBooksPage({Key? key, required this.user}) : super(key: key);

  @override
  _MyBooksState createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooksPage> {
  late SQLiteService sqLiteService;

  late User currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = widget.user;
    sqLiteService = SQLiteService();
    sqLiteService.initDB().whenComplete(() async {
      final users = await sqLiteService.getUsers();
      setState(() {});
    });
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
            'My Books',
            style: TextStyle(
                color: Color.fromARGB(255, 112, 4, 80),
                fontSize: 30,
                fontFamily: 'Langar-Regular'),
          ),
          leading: BackButton(
            color: const Color.fromARGB(255, 112, 4, 80),
            onPressed: () {
              int count = 0;
              Navigator.popUntil(context, (route) {
                return count++ == 2;
              });
            },
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Books for Trade',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 112, 4, 80),
                          size: 32,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewBookPage(
                                      user: currentUser,
                                    )),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: FutureBuilder<List<Book>>(
                      future: sqLiteService.getBooksForUser(currentUser
                          .id), // retrieve books for a specific userID
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Book>> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 112, 4, 80),
                            strokeWidth: 2,
                          ));
                        }
                        List<Book> books = snapshot.data!;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: books.isEmpty
                              ? // Check if the list of books is empty
                              const Center(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        'No Books for Trade found ????',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 112, 4, 80),
                                            fontSize: 20),
                                      )))
                              : // Display message if the list is empty
                              Row(
                                  children:
                                      List.generate(books.length, (index) {
                                    Book book = books[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.grey[200],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.book, size: 50),
                                            Text(
                                              book.title ?? '',
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 8),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditBookPage(
                                                            user: currentUser,
                                                            book: book,
                                                          )),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 112, 4, 80),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 4,
                                                  horizontal: 8,
                                                ),
                                              ),
                                              child: const Text(
                                                'Edit',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                        );
                      }),
                ),
                const SizedBox(height: 24.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Accepted Requests',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.book, size: 50),
                                Text(
                                  'Book ${index + 1}',
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ScanQRPage(
                                                user: currentUser,
                                              )),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 112, 4, 80),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                  ),
                                  child: const Text(
                                    'Scan QR',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'The Books I Give',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.book, size: 50),
                                Text(
                                  'Book ${index + 1}',
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text("Review"),
                                        content: const Text(
                                            "Here is the review of UserX for TitleX they took from you."),
                                        actions: <Widget>[
                                          TextButton(
                                            style: TextButton.styleFrom(
                                                foregroundColor:
                                                    const Color.fromARGB(
                                                        255, 112, 4, 80)),
                                            child: const Text(
                                              "Close",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 112, 4, 80)),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 112, 4, 80),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                  ),
                                  child: const Text(
                                    'My Review',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'The Books I Get',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.book, size: 50),
                                Text(
                                  'Book ${index + 1}',
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WriteReviewPage(
                                                username: "johnli7",
                                                bookTitle: "LOTR",
                                              )),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 112, 4, 80),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                  ),
                                  child: const Text(
                                    'Give Review',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ));
  }
}
