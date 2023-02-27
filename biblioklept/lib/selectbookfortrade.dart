import 'package:flutter/material.dart';
import "package:biblioklept/contactdetailsfortrade.dart";
import 'main.dart';

class SelectBookforTrade extends StatefulWidget {
  late User user;
  SelectBookforTrade({super.key, required this.user});

  @override
  _SelectBookforTradeState createState() => _SelectBookforTradeState();
}

class _SelectBookforTradeState extends State<SelectBookforTrade> {
  late SQLiteService sqLiteService;

  late User currentUser;
  late List<Book> _books = <Book>[];

  @override
  void initState() {
    super.initState();
    currentUser = widget.user;
    sqLiteService = SQLiteService();
    sqLiteService.initDB().whenComplete(() async {
      final books = await sqLiteService.getBooksForUser(currentUser.id);
      setState(() {
        _books = books;
      });
    });
  }

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          title: const Text(
            'My Books',
            style: TextStyle(
                color: Color.fromARGB(255, 112, 4, 80),
                fontSize: 32,
                fontFamily: 'Langar-Regular'),
          ),
          centerTitle: true,
          leading: const BackButton(
            color: Color.fromARGB(255, 112, 4, 80),
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Choose a Book to Trade:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300],
                      indent: 16,
                      endIndent: 16,
                    );
                  },
                  itemCount: _books.length,
                  itemBuilder: (BuildContext context, int index) {
                    final book = _books[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${book.title} by ${book.author}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _selectedIndex == index
                                    ? const Color.fromARGB(255, 112, 4, 80)
                                    : Colors.grey[300],
                              ),
                              child: _selectedIndex == index
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _selectedIndex != -1
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactFormPage(user: currentUser,),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color.fromARGB(255, 112, 4, 80),
                        foregroundColor: Colors.white,
                        fixedSize: const Size(200, 40)),
                    child:
                        const Text('Continue', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
