import 'package:biblioklept/selectbookfortrade.dart';
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

  BookDetailsPage({
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
        title: Text("$title from $username"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title: $title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Divider(thickness: 2, height: 20),
                Text(
                  'Author: $author',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2, height: 20),
                Text(
                  'Publisher: $publisher',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2, height: 20),
                Text(
                  'Summary: $summary',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2, height: 20),
                Text(
                  'Number of pages: $pages',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2, height: 20),
                Text(
                  'Category: $category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2, height: 20),
                Text(
                  'Condition: $condition',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2, height: 20),
                Text(
                  'Year of purchase: $year',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2, height: 20),
                Text(
                  'Owner\'s address: $address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2, height: 20),
                Text(
                  'Owner\'s email: $email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectBookforTrade()),
                    );
                  },
                  child: Text('Select the book you want to trade for'),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
