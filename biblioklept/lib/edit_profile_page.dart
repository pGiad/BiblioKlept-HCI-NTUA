import 'package:biblioklept/main.dart';
import 'package:biblioklept/mainpage.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  late User user;
  EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

enum Gender { male, female, other }

class _EditProfilePageState extends State<EditProfilePage> {
  late SQLiteService sqLiteService;

  final _emailController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  int? _selectedAge;
  Gender? _selectedGender;
  final _genderController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  bool _canUpdateProfile = false;

  late User currentUser;
  List<User> _users = <User>[];

  @override
  void dispose() {
    _emailController.dispose();
    _fullnameController.dispose();
    _usernameController.dispose();
    _genderController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    String fullname = _fullnameController.text;
    String username = _usernameController.text;
    String email = _emailController.text;
    int age = _selectedAge!;
    Gender gender = _selectedGender!;
    String address = _addressController.text;
    String password = _passwordController.text;
    String repeatedPassword = _repeatPasswordController.text;

    final matchedUser = _users.any(
        (user) => (user.username == username && user.id != currentUser.id));

    if (password == repeatedPassword && !matchedUser) {
      currentUser = User(
          id: widget.user.id,
          username: username,
          fullname: fullname,
          password: password,
          email: email,
          address: address,
          gender: enumToString(gender),
          age: age);

      await sqLiteService.updateUser(currentUser);

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => MainPage(user: currentUser)),
          (r) {
        return false;
      });
    } else if (password != repeatedPassword) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Passwords do not match"),
          content: const Text("Please make sure the passwords match."),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "OK",
                style: TextStyle(color: Color.fromARGB(255, 112, 4, 80)),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Username exists"),
          content: const Text("Please pick another username."),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "OK",
                style: TextStyle(color: Color.fromARGB(255, 112, 4, 80)),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  void _updateCanProfile() {
    setState(() {
      _canUpdateProfile = _fullnameController.text.isNotEmpty &&
          _usernameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _selectedAge != null &&
          _selectedGender != null &&
          _addressController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _repeatPasswordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    sqLiteService = SQLiteService();
    sqLiteService.initDB().whenComplete(() async {
      final users = await sqLiteService.getUsers();
      setState(() {
        _users = users;
      });
    });
    currentUser = widget.user;
    _fullnameController.addListener(_updateCanProfile);
    _usernameController.addListener(_updateCanProfile);
    _emailController.addListener(_updateCanProfile);
    _addressController.addListener(_updateCanProfile);
    _passwordController.addListener(_updateCanProfile);
    _repeatPasswordController.addListener(_updateCanProfile);
  }

  String enumToString(Gender gender) {
    if (gender == Gender.male) {
      return "Male";
    } else if (gender == Gender.female) {
      return "Female";
    } else {
      return "Other";
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
              toolbarHeight: 70,
              elevation: 0,
              backgroundColor: Colors.transparent,
              bottomOpacity: 0,
              centerTitle: true,
              title: const Text(
                'Edit Profile',
                style: TextStyle(
                    color: Color.fromARGB(255, 112, 4, 80),
                    fontSize: 32,
                    fontFamily: 'Langar-Regular'),
              ),
              leading: BackButton(
                color: const Color.fromARGB(255, 112, 4, 80),
                onPressed: () {
                  int count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 2;
                  });
                },
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: _fullnameController,
                            decoration: InputDecoration(
                              labelText: 'Fullname',
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
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
                          ),
                          const SizedBox(height: 16.0),
                          Text('Age: ${_selectedAge ?? ''}'),
                          const SizedBox(height: 10.0),
                          Slider(
                            value: (_selectedAge ?? 12).toDouble(),
                            min: 12,
                            max: 99,
                            divisions: 82,
                            activeColor: const Color.fromARGB(128, 24, 24, 24),
                            thumbColor: const Color.fromARGB(255, 112, 4, 80),
                            inactiveColor:
                                const Color.fromARGB(128, 24, 24, 24),
                            label: _selectedAge?.toString() ?? '12',
                            onChanged: (double value) {
                              setState(() {
                                _selectedAge = value.toInt();
                              });
                            },
                          ),
                          const SizedBox(height: 24.0),
                          DropdownButtonFormField<Gender>(
                            value: _selectedGender,
                            decoration: InputDecoration(
                              labelText: 'Gender',
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            items: Gender.values.map((Gender gender) {
                              return DropdownMenuItem<Gender>(
                                  value: gender,
                                  child: Text(
                                    enumToString(gender),
                                  ));
                            }).toList(),
                            onChanged: (Gender? value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
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
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: _repeatPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Repeat Password',
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed:
                                _canUpdateProfile ? _updateProfile : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 112, 4, 80),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fixedSize: const Size(200, 40)),
                            child: const Text('Save Changes',
                                style: TextStyle(fontSize: 18)),
                          ),
                          const SizedBox(height: 20.0),
                          TextButton(
                            onPressed: () {
                              int count = 0;
                              Navigator.popUntil(context, (route) {
                                return count++ == 2;
                              });
                            },
                            style: TextButton.styleFrom(
                                fixedSize: const Size(100, 50),
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
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
