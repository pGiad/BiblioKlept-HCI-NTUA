import 'package:biblioklept/detailsofbooks.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BiblioKlept());
}

class BiblioKlept extends StatelessWidget {
  const BiblioKlept({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiblioKlept',
      home: BooksNearYouPage(),
    );
  }
}

class BooksNearYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Found the following books near you'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: 10, // replace with actual number of books
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Title of Book $index'),
            subtitle: Text('Username of Owner $index'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookDetailsPage(
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
              child: Text('View'),
            ),
          );
        },
      ),
    );
  }
}
