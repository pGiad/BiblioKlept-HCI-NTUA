import 'package:flutter/material.dart';

class FavoriteGenresPage extends StatefulWidget {
  const FavoriteGenresPage({Key? key}) : super(key: key);

  @override
  _FavoriteGenresState createState() => _FavoriteGenresState();
}

class _FavoriteGenresState extends State<FavoriteGenresPage> {
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
    'Cooking'
  ];
  List<String> _selectedGenres = [];

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
              onPressed: () {
                // Navigate back to the previous screen with the selected genres
                // Navigator.pop(context, _selectedGenres);
              },
              label: const Text('Save'),
              icon: const Icon(Icons.save),
              backgroundColor: const Color.fromARGB(255, 112, 4, 80),
            ),
    );
  }
}
