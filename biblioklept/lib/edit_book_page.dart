import 'package:biblioklept/login_page.dart';
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

class _EditBookPageState extends State<EditBookPage> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _publisherController = TextEditingController();
  final _summaryController = TextEditingController();
  final _numberofpagesController = TextEditingController();
  final _categoryController = TextEditingController();
  final _conditionController = TextEditingController();
  final _yearofpurchaseController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _publisherController.dispose();
    _summaryController.dispose();
    _numberofpagesController.dispose();
    _categoryController.dispose();
    _conditionController.dispose();
    _yearofpurchaseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(199, 255, 194, 174),
      appBar: AppBar(
        title: const Text('Edit Book with TitleX you want to trade'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
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
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'Category',
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
            controller: _conditionController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Condition',
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
            controller: _conditionController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Year of purchase',
              labelStyle: const TextStyle(color: Colors.black54),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            cursorColor: Colors.black,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()), //Front Book cover Page
                      );
            },
             style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
               ),
              primary: Colors.purple,
              ),
            child: const Text('Front Cover'),
          ),
        const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()), //Back book cover Page
                      );
                    },
                    style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.purple,
                    ),
                    child: const Text(
                      'Back Cover',
                      style: TextStyle(
                        color: Color.fromARGB(197, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
      ),
    ),
  ),
);
}
}


