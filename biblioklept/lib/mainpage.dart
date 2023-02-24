import 'package:biblioklept/booksfound.dart';
import 'package:biblioklept/booksnearyou.dart';
import 'package:biblioklept/mybooks.dart';
import 'package:biblioklept/receivedrequests.dart';
import 'package:flutter/material.dart';
import "package:biblioklept/detailsofbooks.dart";
import "package:biblioklept/edit_profile_page.dart";
import "package:biblioklept/savedqrcodes.dart";

void main() {
  runApp(const BiblioKlept());
}

class BiblioKlept extends StatelessWidget {
  const BiblioKlept({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BiblioKlept',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    String searchQuery = " ";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyBooksPage()),
                              );
                            },
                            child: Text('My Books')),
                        value: 3,
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
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BooksNearYouPage()),
                              );
                            },
                            child: Text('Books near you')),
                        value: 3,
                      ),
                      PopupMenuItem(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage()),
                              );
                            },
                            child: Text('Edit Profile')),
                        value: 4,
                      ),
                      PopupMenuItem(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReceivedRequestsPage()),
                              );
                            },
                            child: Text('Requests for trade')),
                        value: 5,
                      ),
                      PopupMenuItem(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SavedQRCodesPage()),
                              );
                            },
                            child: Text('Saved QR codes')),
                        value: 5,
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
                  onChanged: (value) {
                    searchQuery = value;
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  if (searchQuery.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BooksFoundPage()),
                    );
                  }
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
                            Text('Book ${index + 10}'),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookDetailsPage(
                                        title: 'Harry Potter',
                                        username: "pgiad",
                                        author: "JK Rowling",
                                        publisher: "Symmetria",
                                        summary:
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis nulla sed nisl eleifend vestibulum. Nulla facilisi. Morbi vel sapien pharetra, feugiat nibh ut, bibendum orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse nec odio at sem efficitur convallis. Nullam sodales metus vel augue vulputate, in semper velit suscipit. Donec venenatis tortor id felis elementum lobortis. Nam eget sem vitae risus lacinia facilisis. Aliquam ullamcorper dictum elit at pretium. Sed viverra libero et sapien euismod dapibusPellentesque auctor nibh ut enim tincidunt tristique. Donec ullamcorper ipsum vel magna auctor efficitur. Integer euismod ultricies est, in convallis neque hendrerit ac. Praesent efficitur convallis libero, vitae venenatis eros hendrerit nec. Proin rutrum aliquet dolor a vestibulum. Aliquam id tortor id ante sollicitudin interdum non et velit. Nunc congue eleifend ex, at scelerisque mi gravida vel. Phasellus eget enim sit amet dolor dictum scelerisque. Vivamus ullamcorper libero at elit bibendum, in blandit sapien consequat. Vivamus vel ante nisl. Sed eleifend quam sit amet libero luctus, ut tristique ex efficitur. Curabitur quis mollis purus, nec gravida nunc. Suspendisse potenti. Sed volutpat, quam at imperdiet dignissim, purus ante tempor ante, ut consectetur velit tortor vitae leo.Fusce volutpat, enim nec elementum rutrum",
                                        pages: 565,
                                        category: "Fantasy",
                                        condition: "Good",
                                        year: 2022,
                                        address: "Athens",
                                        email: "pgiad@gmail.com"),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[100],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                              ),
                              child: Text(
                                'Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
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
                            ElevatedButton(
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
                                        email: "pgiad@gmail.com"),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[100],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                              ),
                              child: Text(
                                'Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
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
