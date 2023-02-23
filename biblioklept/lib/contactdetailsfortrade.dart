import 'package:biblioklept/mainpage.dart';
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
      home: ContactFormPage(),
    );
  }
}

class ContactFormPage extends StatefulWidget {
  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final _formKey = GlobalKey<FormState>();

  late String _fullName;
  late String _email;
  late String _phoneNumber;
  late String _address;
  late String _preferredDayOfWeek = "Monday";
  late String _preferredDayOfMonth = "12";
  late String _preferredMonth = "January";
  late String _preferredHour = "9:00 AM";

  List<String> _daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  List<String> _hours = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please fill the following form with your contact details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _fullName = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phoneNumber = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _address = value!;
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Select preferred date for trade',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Day of the month',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the day of the month';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _preferredDayOfMonth = value!;
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Month',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the month';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _preferredMonth = value!;
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Preferred hour',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the preferred hour';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _preferredHour = value!;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  child: Text('Submit request'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
