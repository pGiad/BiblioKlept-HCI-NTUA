import 'package:biblioklept/detailsofbooks.dart';
import 'package:flutter/material.dart';

class BooksFoundPage extends StatelessWidget {
  const BooksFoundPage({super.key});

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
            'Books Results',
            style: TextStyle(
                color: Color.fromARGB(255, 112, 4, 80),
                fontSize: 32,
                fontFamily: 'Langar-Regular'),
          ),
          leading: BackButton(
            color: const Color.fromARGB(255, 112, 4, 80),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 16.0),
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text('Title of Book $index'),
                  subtitle: Text('Username of Owner $index'),
                  trailing: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BookDetailsPage(
                                  title: 'Harry Potter',
                                  username: "pgiad",
                                  author: "JK Rowling",
                                  publisher: "Symmetria",
                                  summary: "...",
                                  pages: 565,
                                  category: "Fantasy",
                                  condition: "Good",
                                  year: 2022,
                                  address: "Athens",
                                  email: "pgiad@gmail.com")),
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
                      child: const Icon(Icons.book),
                    ),
                  ));
            },
          ),
        ));
  }
}
