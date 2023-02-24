import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();

  bool _canSendRequest = false;

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _sendRequest() {
    String fullname = _fullnameController.text;
    String email = _emailController.text;
    String phoneNum = _phoneNumberController.text;
    String address = _addressController.text;

    print('Fullname: $fullname');
    print('Email: $email');
    print('Phone Number: $phoneNum');
    print('Address: $address');

    // Send Request logic missing

    int count = 0;
    Navigator.popUntil(context, (route) {
      return count++ == 3;
    });
  }

  void _updateCanSendRequest() {
    setState(() {
      _canSendRequest = _fullnameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _phoneNumberController.text.isNotEmpty &&
          _addressController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _fullnameController.addListener(_updateCanSendRequest);
    _emailController.addListener(_updateCanSendRequest);
    _phoneNumberController.addListener(_updateCanSendRequest);
    _addressController.addListener(_updateCanSendRequest);
  }

  // late String _fullName;
  // late String _email;
  // late String _phoneNumber;
  // late String _address;
  // late String _preferredDayOfWeek = "Monday";
  // late String _preferredDayOfMonth = "12";
  // late String _preferredMonth = "January";
  // late String _preferredHour = "9:00 AM";

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 112, 4, 80),
              onPrimary: Colors.white,
              onSurface: Color.fromARGB(255, 112, 4, 80),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 112, 4, 80),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 112, 4, 80),
              onPrimary: Colors.white,
              onSurface: Color.fromARGB(255, 112, 4, 80),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 112, 4, 80),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  final _focusScopeNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _focusScopeNode.unfocus();
        },
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              elevation: 0,
              backgroundColor: Colors.transparent,
              bottomOpacity: 0,
              leading: const BackButton(
                color: Color.fromARGB(255, 112, 4, 80),
              ),
              centerTitle: true,
              title: const Text(
                "Fill the Form",
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
                child: FocusScope(
                  node: _focusScopeNode,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                                controller: _fullnameController,
                                decoration: InputDecoration(
                                  labelText: 'Full name',
                                  labelStyle:
                                      const TextStyle(color: Colors.black54),
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                cursorColor: Colors.black,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle:
                                    const TextStyle(color: Colors.black54),
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              cursorColor: Colors.black,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _phoneNumberController,
                              decoration: InputDecoration(
                                labelText: 'Phone number',
                                labelStyle:
                                    const TextStyle(color: Colors.black54),
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              cursorColor: Colors.black,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _addressController,
                              decoration: InputDecoration(
                                labelText: 'Address',
                                labelStyle:
                                    const TextStyle(color: Colors.black54),
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              cursorColor: Colors.black,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Preferred Date and Time for Trade',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () => _selectDate(context),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 112, 4, 80),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        fixedSize: const Size(200, 40)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.calendar_today),
                                        const SizedBox(width: 8),
                                        Text(
                                          DateFormat('yyyy-MM-dd')
                                              .format(_selectedDate),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () => _selectTime(context),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 112, 4, 80),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        fixedSize: const Size(200, 40)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.access_time),
                                        const SizedBox(width: 8),
                                        Text(
                                          _selectedTime.format(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 100),
                            ElevatedButton(
                                onPressed:
                                    _canSendRequest ? _sendRequest : null,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 112, 4, 80),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    fixedSize: const Size(200, 40)),
                                child: const Text(
                                  'Send Request',
                                  style: TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))));
  }
}
