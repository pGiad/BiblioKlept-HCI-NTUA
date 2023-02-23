import 'package:flutter/material.dart';
import "package:biblioklept/contactdetailsfortrade.dart";

void main() {
  runApp(const BiblioKlept());
}

class BiblioKlept extends StatelessWidget {
  const BiblioKlept({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiblioKlept',
      home: SelectBookforTrade(),
    );
  }
}

class SelectBookforTrade extends StatefulWidget {
  @override
  _SelectBookforTradeState createState() => _SelectBookforTradeState();
}

class _SelectBookforTradeState extends State<SelectBookforTrade> {
  List<String> _bookOptions = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];
  List<bool> _isSelected = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My Books'),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Select your book:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey[300],
                  indent: 16,
                  endIndent: 16,
                );
              },
              itemCount: _bookOptions.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _bookOptions[index],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isSelected[index]
                              ? Colors.blue
                              : Colors.grey[300],
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          ),
                          onPressed: () {
                            setState(() {
                              for (int i = 0; i < _isSelected.length; i++) {
                                _isSelected[i] = i == index;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactFormPage(),
                    ),
                  );
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
