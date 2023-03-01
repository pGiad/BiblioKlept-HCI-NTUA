import 'package:biblioklept/detailsofbooks.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class BooksNearYouPage extends StatefulWidget {
  late User user;
  BooksNearYouPage({Key? key, required this.user}) : super(key: key);

  @override
  _BooksNearYouState createState() => _BooksNearYouState();
}

class _BooksNearYouState extends State<BooksNearYouPage> {
  late SQLiteService sqLiteService;

  late User currentUser;
  late List<Book> _books = <Book>[];

  @override
  void initState() {
    super.initState();
    currentUser = widget.user;
    sqLiteService = SQLiteService();
    sqLiteService.initDB().whenComplete(() async {
      final books = await sqLiteService.getBooksNotOwnedByUser(currentUser.id!);
      setState(() {
        _books = books;
      });
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
            'Books Near Me',
            style: TextStyle(
                color: Color.fromARGB(255, 112, 4, 80),
                fontSize: 32,
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
          child: _books.isEmpty
              ? const Center(
                  child: Text(
                  'No Books Found 😓',
                  style: TextStyle(
                      color: Color.fromARGB(255, 112, 4, 80), fontSize: 20),
                ))
              : ListView.separated(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: _books.length,
                  itemBuilder: (BuildContext context, int index) {
                    final book = _books[index];
                    return FutureBuilder<User?>(
                      future: sqLiteService.getUserById(book.userID!),
                      builder: (BuildContext context,
                          AsyncSnapshot<User?> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator(
                            color: Color.fromARGB(255, 112, 4, 80),
                            strokeWidth: 2,
                          );
                        }
                        final user = snapshot.data;
                        final username = user?.username ?? 'Unknown';
                        return ListTile(
                          title: Text(book.title!),
                          subtitle: Text(username),
                          trailing: SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookDetailsPage(
                                      user: currentUser,
                                      book: book,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 112, 4, 80),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fixedSize: const Size(200, 40),
                              ),
                              child: const Icon(Icons.book),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
        ));
  }
}
