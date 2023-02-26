import 'package:flutter/material.dart';
import 'package:biblioklept/main.dart';
import 'signup_page.dart';
import 'mainpage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BiblioKlept',
      home: Scaffold(
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
  late SQLiteService sqLiteService;
  List<User> _users = <User>[];

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  late User _authenticated_user = User(username: '', password: '');

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

    final matchedUser = _users.any(
      (user) => user.username == username && user.password == password,
    );
    if (matchedUser) {
      _authenticated_user = _users.firstWhere(
        (user) => user.username == username && user.password == password,
      );
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return MainPage(user: _authenticated_user);
      }), (r) {
        return false;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Invalid Credentials"),
          content: const Text("Your username or password is incorrect."),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 112, 4, 80)),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "OK",
                style: TextStyle(color: Color.fromARGB(255, 112, 4, 80)),
              ),
            ),
          ],
        ),
      );
    }
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
    sqLiteService = SQLiteService();
    sqLiteService.initDB().whenComplete(() async {
      final users = await sqLiteService.getUsers();
      setState(() {
        _users = users;
      });
    });
    _usernameController.addListener(_updateCanLogin);
    _passwordController.addListener(_updateCanLogin);
  }

  final _focusScopeNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _focusScopeNode.unfocus();
        },
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowIndicator();
                  return true;
                },
                child: FocusScope(
                  node: _focusScopeNode,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16.0),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 50.0, bottom: 60.0),
                          child: Text(
                            'BiblioKlept',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Langar-Regular'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 16.0),
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
                        const SizedBox(height: 16.0),
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
                        const SizedBox(height: 40.0),
                        ElevatedButton(
                          onPressed: _canLogin ? _login : null,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 112, 4, 80), // sets the background color
                              foregroundColor:
                                  Colors.white, // sets the text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              fixedSize: const Size(200, 40)),
                          child: const Text('Login',
                              style: TextStyle(fontSize: 18)),
                        ),
                        const SizedBox(height: 50.0),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Text("Don't have an account?",
                                  style: Theme.of(context).textTheme.bodyText2,
                                  textAlign: TextAlign.center),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                    foregroundColor:
                                        const Color.fromARGB(255, 112, 4, 80)),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 112, 4, 80),
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
                ))));
  }
}
