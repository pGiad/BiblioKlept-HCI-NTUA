import 'package:flutter/material.dart';
import 'mainpage.dart';
import 'package:biblioklept/main.dart';

class FavoriteGenresPage extends StatefulWidget {
  late User user;
  FavoriteGenresPage({Key? key, required this.user}) : super(key: key);

  @override
  _FavoriteGenresState createState() => _FavoriteGenresState();
}

class _FavoriteGenresState extends State<FavoriteGenresPage> {
  late SQLiteService sqLiteService;

  // Declare any necessary variables or lists here
  final List<String> _genreList = [
    'Art',
    'Romance',
    'Science',
    'Poetry',
    'Crime',
    'Biography',
    'Adventure',
    'Comedy',
    'Comics',
    'Science Fiction',
    'Mystery',
    'Literature',
    'Fantasy',
    'Kids',
    'Cooking',
    'Other'
  ];
  List<String> _selectedGenres = [];

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

  // Create a method to handle changes to checkbox states
  void _onGenreSelected(bool selected, String genre) {
    setState(() {
      if (selected) {
        _selectedGenres.add(genre);
      } else {
        _selectedGenres.remove(genre);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Create the scaffold for the page
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130.0),
        child: AppBar(
          toolbarHeight: 180,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          title: const Text(
            'Choose Your\nFavorite Genres',
            style: TextStyle(
                color: Color.fromARGB(255, 112, 4, 80),
                fontSize: 32,
                fontFamily: 'Langar-Regular'),
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: Column(
              children: <Widget>[
                // Display each genre as a checkbox
                for (String genre in _genreList)
                  CheckboxListTile(
                    title: Text(genre),
                    activeColor: const Color.fromARGB(255, 112, 4, 80),
                    checkColor: Colors.white,
                    value: _selectedGenres.contains(genre),
                    onChanged: (bool? selected) {
                      _onGenreSelected(selected!, genre);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _selectedGenres.isEmpty
          ? const FloatingActionButton.extended(
              onPressed: null,
              label: Text('Save'),
              icon: Icon(Icons.save),
              backgroundColor: Colors.grey,
              disabledElevation: 0,
            )
          : FloatingActionButton.extended(
              onPressed: () async {
                currentUser = User(
                    id: widget.user.id,
                    username: widget.user.username,
                    fullname: widget.user.fullname,
                    password: widget.user.password,
                    email: widget.user.email,
                    address: widget.user.address,
                    gender: widget.user.gender,
                    age: widget.user.age,
                    categories: _selectedGenres);

                await sqLiteService.updateUser(currentUser);

                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MainPage(user: currentUser);
                }), (r) {
                  return false;
                });
              },
              label: const Text('Save'),
              icon: const Icon(Icons.save),
              backgroundColor: const Color.fromARGB(255, 112, 4, 80),
            ),
    );
  }
}
