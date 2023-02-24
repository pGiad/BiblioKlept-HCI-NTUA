import 'package:flutter/material.dart';

void main() {
  runApp(const BiblioKlept());
}

class BiblioKlept extends StatelessWidget {
  const BiblioKlept({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BiblioKlept',
      home: EditBookPage(),
    );
  }
}

class EditBookPage extends StatefulWidget {
  const EditBookPage({Key? key}) : super(key: key);

  @override
  _EditBookPageState createState() => _EditBookPageState();
}

enum Condition { brandNew, likeNew, used, old }

class _EditBookPageState extends State<EditBookPage> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _publisherController = TextEditingController();
  final _summaryController = TextEditingController();
  final _numberofpagesController = TextEditingController();
  String? _categoryController;
  Condition? _conditionController;
  int? _yearofpurchaseController;

  bool _canSaveChanges = false;

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _publisherController.dispose();
    _summaryController.dispose();
    _numberofpagesController.dispose();
    super.dispose();
  }

  void _deleteBook() async {
    bool? delBook = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: const Text('Are you sure you want to delete this book?'),
              actions: <Widget>[
                TextButton(
                    onPressed: ((() => Navigator.pop(context, false))),
                    style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 112, 4, 80)),
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: ((() => Navigator.pop(context, true))),
                    style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 112, 4, 80)),
                    child: const Text('Yes')),
              ],
            ));
    // if (delBook!) {
    // _books.removeAt(idx);
    // setState(() {});
    // }
  }

  void _saveChanges() {
    final int? numPages = int.tryParse(_numberofpagesController.text);
    if (numPages == null || numPages <= 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Invalid input'),
          content:
              const Text('Please enter a valid number for number of pages.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'OK',
                style: TextStyle(color: Color.fromARGB(255, 112, 4, 80)),
              ),
            ),
          ],
        ),
      );
      return;
    }
    // continue with your code if input is valid

    String title = _titleController.text;
    String author = _authorController.text;
    String publisher = _publisherController.text;
    String summary = _summaryController.text;
    String category = _categoryController!;
    Condition condition = _conditionController!;
    int year = _yearofpurchaseController!;

    print('Title: $title');
    print('Author: $author');
    print('Publisher: $publisher');
    print('Summary: $summary');
    print('No. of Pages: $numPages');
    print('Category: $category');
    print('Condition: $condition');
    print('Year of Purchase: $year');

    // Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => const LoginPage()), //Front Book cover Page
    //         );
  }

  void _updateCanSaveChanges() {
    setState(() {
      _canSaveChanges = _titleController.text.isNotEmpty &&
          _authorController.text.isNotEmpty &&
          _publisherController.text.isNotEmpty &&
          _summaryController.text.isNotEmpty &&
          _numberofpagesController.text.isNotEmpty &&
          _categoryController != null &&
          _conditionController != null &&
          _yearofpurchaseController != null;
    });
  }

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_updateCanSaveChanges);
    _authorController.addListener(_updateCanSaveChanges);
    _publisherController.addListener(_updateCanSaveChanges);
    _summaryController.addListener(_updateCanSaveChanges);
    _numberofpagesController.addListener(_updateCanSaveChanges);
  }

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

  String enumToString(Condition condition) {
    if (condition == Condition.brandNew) {
      return "Brand New";
    } else if (condition == Condition.likeNew) {
      return "Like New";
    } else if (condition == Condition.used) {
      return "Used";
    } else {
      return "Old";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          title: const Text(
            'Edit Book with TitleX\nyou want to trade',
            style: TextStyle(
                color: Color.fromARGB(255, 112, 4, 80),
                fontSize: 32,
                fontFamily: 'Langar-Regular'),
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _authorController,
                    decoration: InputDecoration(
                      labelText: 'Author',
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _publisherController,
                    decoration: InputDecoration(
                      labelText: 'Publisher',
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _summaryController,
                    decoration: InputDecoration(
                      labelText: 'Summary',
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _numberofpagesController,
                    decoration: InputDecoration(
                      labelText: 'Number of Pages',
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    value: _categoryController,
                    decoration: InputDecoration(
                      labelText: 'Category',
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    items: _genreList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _categoryController = value;
                      });
                      _updateCanSaveChanges();
                    },
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<Condition>(
                    value: _conditionController,
                    decoration: InputDecoration(
                      labelText: 'Condition',
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    items: Condition.values.map((Condition condition) {
                      return DropdownMenuItem<Condition>(
                          value: condition,
                          child: Text(
                            enumToString(condition),
                          ));
                    }).toList(),
                    onChanged: (Condition? value) {
                      setState(() {
                        _conditionController = value;
                      });
                      _updateCanSaveChanges();
                    },
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<int>(
                    value: _yearofpurchaseController,
                    decoration: InputDecoration(
                      labelText: 'Year of purchase',
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    items: List.generate(74, (index) => index + 1950)
                        .reversed
                        .map((year) => DropdownMenuItem<int>(
                              value: year,
                              child: Text(
                                year.toString(),
                              ),
                            ))
                        .toList(),
                    onChanged: (int? value) {
                      setState(() {
                        _yearofpurchaseController = value;
                      });
                      _updateCanSaveChanges();
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 300, // set the width to 300 pixels
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/front_cover_sample.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  const SizedBox.expand(),
                                  Center(
                                    child: SizedBox(
                                      width: 85,
                                      height: 70,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 112, 4, 80),
                                        ),
                                        child: const Icon(Icons.add_a_photo,
                                            size: 50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/back_cover_sample.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  const SizedBox.expand(),
                                  Center(
                                    child: SizedBox(
                                      width: 85,
                                      height: 70,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 112, 4, 80),
                                        ),
                                        child: const Icon(Icons.add_a_photo,
                                            size: 50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: _canSaveChanges ? _saveChanges : null,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color.fromARGB(255, 112, 4, 80),
                        foregroundColor: Colors.white,
                        fixedSize: const Size(200, 40)),
                    child: const Text('Save Changes',
                        style: TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 112, 4, 80)),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                              color: Color.fromARGB(255, 112, 4, 80),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _deleteBook();
                        },
                        style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 112, 4, 80)),
                        child: const Text(
                          'Remove Book',
                          style: TextStyle(
                              color: Color.fromARGB(255, 112, 4, 80),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
