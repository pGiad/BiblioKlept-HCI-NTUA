import 'package:biblioklept/booksfound.dart';
import 'package:biblioklept/booksnearyou.dart';
import 'package:biblioklept/mybooks.dart';
import 'package:biblioklept/receivedrequests.dart';
import 'package:flutter/material.dart';
import "package:biblioklept/detailsofbooks.dart";
import "package:biblioklept/edit_profile_page.dart";
import "package:biblioklept/savedqrcodes.dart";
import "package:biblioklept/main.dart";

class MainPage extends StatefulWidget {
  late User user;
  MainPage({Key? key, required this.user}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _focusScopeNode = FocusScopeNode();

  final List<String> bookCategories = [
    'Art',
    'Romance',
    'Science',
    'Poetry',
    'Crime',
    'Biography',
    'Adventure',
    'Comedy',
    'Comics',
    'Science-Fiction',
    'Mystery',
    'Literature',
  ];

  late User currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    String searchQuery = " ";
    return GestureDetector(
        onTap: () {
          _focusScopeNode.unfocus();
        },
        child: FocusScope(
            node: _focusScopeNode,
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 70,
                  backgroundColor: const Color.fromARGB(255, 112, 4, 80),
                  automaticallyImplyLeading: false,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Color.fromARGB(255, 112, 4, 80),
                          ),
                          onPressed: () {
                            showMenu(
                              context: context,
                              position:
                                  const RelativeRect.fromLTRB(20, 70, 30, 0),
                              items: [
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyBooksPage()),
                                      );
                                    },
                                    child: const ListTile(
                                      title: Text(
                                        'My Books',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 112, 4, 80)),
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                      onTap: () {
                                        showMenu(
                                          context: context,
                                          position: const RelativeRect.fromLTRB(
                                              20, 70, 30, 0),
                                          items: [
                                            ...bookCategories.map(
                                              (category) =>
                                                  PopupMenuItem<String>(
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  BooksFoundPage()),
                                                        );
                                                      },
                                                      child: ListTile(
                                                        title: Text(
                                                          category,
                                                          style:
                                                              const TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          112,
                                                                          4,
                                                                          80)),
                                                        ),
                                                      ),
                                                    ),
                                                    const Divider()
                                                  ])),
                                            ),
                                          ],
                                          elevation: 16.0,
                                        );
                                      },
                                      child: const ListTile(
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color:
                                              Color.fromARGB(255, 112, 4, 80),
                                        ),
                                        title: Text(
                                          'Search by Category',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 112, 4, 80)),
                                        ),
                                      )),
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BooksNearYouPage()),
                                      );
                                    },
                                    child: const ListTile(
                                      title: Text(
                                        'Books Near Me',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 112, 4, 80)),
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReceivedRequestsPage()),
                                      );
                                    },
                                    child: const ListTile(
                                      title: Text(
                                        'Received Requests',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 112, 4, 80)),
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SavedQRCodesPage()),
                                      );
                                    },
                                    child: const ListTile(
                                      title: Text(
                                        'Saved QR Codes',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 112, 4, 80)),
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditProfilePage(
                                                  user: currentUser,
                                                )),
                                      );
                                    },
                                    child: const ListTile(
                                      title: Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 112, 4, 80)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Expanded(
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              hintText: 'Search for Books',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                            ),
                            onChanged: (value) {
                              searchQuery = value;
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 112, 4, 80),
                          ),
                          onPressed: () {
                            if (searchQuery.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BooksFoundPage()),
                              );
                            }
                          },
                        ),
                      ],
                    ),
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
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
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
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
                              onNotification: (overScroll) {
                                overScroll.disallowIndicator();
                                return true;
                              },
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(10, (index) {
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
                                              'Book ${index + 10}',
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 8),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BookDetailsPage(
                                                            title:
                                                                'Harry Potter',
                                                            username: "pgiad",
                                                            author:
                                                                "JK Rowling",
                                                            publisher:
                                                                "Symmetria",
                                                            summary:
                                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis nulla sed nisl eleifend vestibulum. Nulla facilisi. Morbi vel sapien pharetra, feugiat nibh ut, bibendum orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse nec odio at sem efficitur convallis. Nullam sodales metus vel augue vulputate, in semper velit suscipit. Donec venenatis tortor id felis elementum lobortis. Nam eget sem vitae risus lacinia facilisis. Aliquam ullamcorper dictum elit at pretium. Sed viverra libero et sapien euismod dapibusPellentesque auctor nibh ut enim tincidunt tristique. Donec ullamcorper ipsum vel magna auctor efficitur. Integer euismod ultricies est, in convallis neque hendrerit ac. Praesent efficitur convallis libero, vitae venenatis eros hendrerit nec. Proin rutrum aliquet dolor a vestibulum. Aliquam id tortor id ante sollicitudin interdum non et velit. Nunc congue eleifend ex, at scelerisque mi gravida vel. Phasellus eget enim sit amet dolor dictum scelerisque. Vivamus ullamcorper libero at elit bibendum, in blandit sapien consequat. Vivamus vel ante nisl. Sed eleifend quam sit amet libero luctus, ut tristique ex efficitur. Curabitur quis mollis purus, nec gravida nunc. Suspendisse potenti. Sed volutpat, quam at imperdiet dignissim, purus ante tempor ante, ut consectetur velit tortor vitae leo.Fusce volutpat, enim nec elementum rutrum",
                                                            pages: 565,
                                                            category: "Fantasy",
                                                            condition: "Good",
                                                            year: 2022,
                                                            address: "Athens",
                                                            email:
                                                                "pgiad@gmail.com"),
                                                  ),
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
                                                'Details',
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
                              ),
                            )),
                        const SizedBox(height: 20),
                        const Padding(
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
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
                              onNotification: (overScroll) {
                                overScroll.disallowIndicator();
                                return true;
                              },
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(10, (index) {
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
                                              'Book ${index + 10}',
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 8),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BookDetailsPage(
                                                            title:
                                                                'Harry Potter',
                                                            username: "pgiad",
                                                            author:
                                                                "JK Rowling",
                                                            publisher:
                                                                "Symmetria",
                                                            summary: "...",
                                                            pages: 565,
                                                            category: "Fantasy",
                                                            condition: "Good",
                                                            year: 2022,
                                                            address: "Athens",
                                                            email:
                                                                "pgiad@gmail.com"),
                                                  ),
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
                                                'Details',
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
                              ),
                            )),
                      ],
                    ),
                  ),
                ))));
  }
}
