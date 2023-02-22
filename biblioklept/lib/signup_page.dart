import 'package:flutter/material.dart';
import 'favorite_genres.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

enum Gender { male, female, other }

class _SignUpFormState extends State<SignUpPage> {
  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  int? _selectedAge;
  Gender? _selectedGender;
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  bool _canSignUp = false;

  @override
  void dispose() {
    _fullnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    String fullname = _fullnameController.text;
    String username = _usernameController.text;
    String email = _emailController.text;
    int age = _selectedAge!;
    Gender gender = _selectedGender!;
    String address = _addressController.text;
    String password = _passwordController.text;
    String repeatedPassword = _repeatPasswordController.text;

    if (password == repeatedPassword) {
      print('Fullname: $fullname');
      print('Username: $username');
      print('Email: $email');
      print('Age: $age');
      print('Gender: $gender');
      print('Address: $address');
      print('Password: $password');

      // Sign Up logic missing

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteGenresPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Passwords do not match"),
          content: const Text("Please make sure the passwords match."),
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "OK",
                style: TextStyle(color: Color.fromARGB(199, 164, 85, 0)),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  void _updateCanSignUp() {
    setState(() {
      _canSignUp = _fullnameController.text.isNotEmpty &&
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
    _fullnameController.addListener(_updateCanSignUp);
    _usernameController.addListener(_updateCanSignUp);
    _emailController.addListener(_updateCanSignUp);
    _addressController.addListener(_updateCanSignUp);
    _passwordController.addListener(_updateCanSignUp);
    _repeatPasswordController.addListener(_updateCanSignUp);
  }

  String enumToString(Gender gender) {
    if (gender == Gender.male) {
      return "male";
    } else if (gender == Gender.female) {
      return "female";
    } else {
      return "other";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(199, 255, 194, 174),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        leading: const BackButton(
          color: Color.fromARGB(199, 164, 85, 0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'BiblioKlept',
              // style: TextStyle(
              //     fontFamily: 'Langar-Regular',
              //     fontSize: 35,
              //     fontWeight: FontWeight.bold
              //     ),
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.bold, fontFamily: 'Langar-Regular'),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _fullnameController,
              decoration: InputDecoration(
                labelText: 'Fullname',
                labelStyle: const TextStyle(color: Colors.black54),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Colors.black,
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: const TextStyle(color: Colors.black54),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Colors.black,
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.black54),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Colors.black,
            ),
            const SizedBox(height: 24.0),
            Text('Age: ${_selectedAge ?? ''}'),
            const SizedBox(height: 10.0),
            Slider(
              value: (_selectedAge ?? 18).toDouble(),
              min: 18,
              max: 100,
              divisions: 82,
              label: _selectedAge?.toString() ?? '18',
              onChanged: (double value) {
                setState(() {
                  _selectedAge = value.toInt();
                });
                _updateCanSignUp();
              },
            ),
            // const SizedBox(height: 24.0),
            // DropdownButtonFormField<int>(
            //   value: _selectedAge,
            //   decoration: InputDecoration(
            //     labelText: 'Age',
            //     labelStyle: const TextStyle(color: Colors.black54),
            //     border: const OutlineInputBorder(),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //   ),
            //   items: List.generate(83, (index) => index + 18)
            //       .map((age) => DropdownMenuItem<int>(
            //             value: age,
            //             child: Text(age.toString()),
            //           ))
            //       .toList(),
            //   onChanged: (int? value) {
            //     setState(() {
            //       _selectedAge = value;
            //     });
            //     _updateCanSignUp();
            //   },
            // ),

            const SizedBox(height: 24.0),
            DropdownButtonFormField<Gender>(
              value: _selectedGender,
              decoration: InputDecoration(
                labelText: 'Gender',
                labelStyle: const TextStyle(color: Colors.black54),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: Gender.values.map((Gender gender) {
                return DropdownMenuItem<Gender>(
                    value: gender, child: Text(enumToString(gender)));
              }).toList(),
              onChanged: (Gender? value) {
                setState(() {
                  _selectedGender = value;
                });
                _updateCanSignUp();
              },
            ),

            const SizedBox(height: 24.0),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: const TextStyle(color: Colors.black54),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Colors.black,
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.black54),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Colors.black,
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _repeatPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Repeat Password',
                labelStyle: const TextStyle(color: Colors.black54),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              cursorColor: Colors.black,
            ),
            const SizedBox(height: 70.0),
            ElevatedButton(
              onPressed: _canSignUp ? _signUp : null,
              child: const Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 225, 169), // sets the background color
                  foregroundColor: const Color.fromARGB(
                      199, 164, 85, 0), // sets the text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fixedSize: const Size(200, 40)),
            ),
          ],
        ),
      ),
    );
  }
}
