import 'package:flutter/material.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Page',
      home: Scaffold(
        backgroundColor: Color.fromARGB(199, 255, 194, 174),
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _canLogin = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Your login logic here

    print('Username: $username');
    print('Password: $password');
  }

  void _updateCanLogin() {
    setState(() {
      _canLogin = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateCanLogin);
    _passwordController.addListener(_updateCanLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(top: 250.0, bottom: 150.0),
              child: Text(
                'BiblioKlept',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold, fontFamily: 'Langar-Regular'),
                textAlign: TextAlign.center,
              ),
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
            const SizedBox(height: 70.0),
            ElevatedButton(
              onPressed: _canLogin ? _login : null,
              child: const Text('Login'),
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
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.all(110.0),
              child: Column(
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromARGB(199, 164, 85, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
