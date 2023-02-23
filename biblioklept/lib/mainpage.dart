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
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(20, 70, 30, 0),
                    items: [
                      PopupMenuItem(
                        child: Text('My Books'),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Text('Search by category'),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: Text('Books near you'),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: Text('Edit Profile'),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: Text('Requests for trade'),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: Text('Saved QR codes'),
                        value: 2,
                      ),
                    ],
                  );
                },
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for Books',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Perform search action here
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Our suggestions for you',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.book, size: 50),
                            Text('Book $index'),
                            SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[100],
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                              child: Text(
                                'Details',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
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
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Hot picks',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.book, size: 50),
                            Text('Book ${index + 10}'),
                            SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[100],
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                              child: Text(
                                'Details',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
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
          ],
        ),
      ),
    );
  }
}
