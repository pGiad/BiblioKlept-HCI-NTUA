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
          content: const Text(
              "Your username or password is incorrect. You can try testing credentials username: pgiad, password: 1, or create a new account."),
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
      if (users.isEmpty) {
        initializeDB();
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return LoginPage();
        }), (r) {
          return false;
        });
      }
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

// This function is used for DB initialization when there are no users present in it
  Future<void> initializeDB() async {
    User pgiad = User(
        username: 'pgiad',
        fullname: 'panagiotis padikiaroglou',
        password: '1',
        email: 'pgiad@gmail.com',
        age: 22,
        address: 'Katexaki 42',
        gender: 'Male',
        categories: ['Art', 'Science', 'Literature', 'Comics']);
    await sqLiteService.addUser(pgiad);

    Book harry = Book(
        title: 'Harry Potter',
        author: 'Lennox Flores',
        publisher: 'Tziola',
        summary:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        numberofpages: 200,
        category: 'Fantasy',
        condition: 'Old',
        yearofpurchase: 2015,
        userID: 1);
    await sqLiteService.addBook(harry);

    Book lotr = Book(
        title: 'LOTR',
        author: 'JRR Kolkien',
        publisher: 'Kleidarithmos',
        summary:
            "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        numberofpages: 233,
        category: 'Science',
        condition: 'Brand New',
        yearofpurchase: 1999,
        userID: 1);
    await sqLiteService.addBook(lotr);

    Book farm = Book(
        title: 'Animal Farm',
        author: 'George Orfell',
        publisher: 'Symmetria',
        summary:
            "Aliquam eleifend mi in nulla posuere sollicitudin aliquam ultrices.",
        numberofpages: 150,
        category: 'Literature',
        condition: 'Old',
        yearofpurchase: 1980,
        userID: 1);
    await sqLiteService.addBook(farm);

    Book maths = Book(
        title: 'Mathematics',
        author: 'T. Rassias',
        publisher: 'Tziola',
        summary:
            "Nunc scelerisque viverra mauris in aliquam. Aliquet lectus proin nibh nisl condimentum id venenatis a.",
        numberofpages: 952,
        category: 'Science',
        condition: 'Like New',
        yearofpurchase: 2005,
        userID: 1);
    await sqLiteService.addBook(maths);

    Book moby = Book(
        title: 'Moby Dick',
        author: 'Herman Mertille',
        publisher: 'Pataki',
        summary:
            "Arcu ac tortor dignissim convallis aenean. Faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis aliquam.",
        numberofpages: 189,
        category: 'Literature',
        condition: 'Like New',
        yearofpurchase: 1990,
        userID: 1);
    await sqLiteService.addBook(moby);

    User amerikanos = User(
        username: 'amerikanos',
        fullname: 'mixail raptopoulos',
        password: '1',
        email: 'amerika@gmail.com',
        age: 25,
        address: 'Tinou 87',
        gender: 'Male',
        categories: ['Comedy', 'Romance', 'Poetry', 'Art']);
    await sqLiteService.addUser(amerikanos);

    Book beloved = Book(
        title: 'Beloved',
        author: 'Toni Morricot',
        publisher: 'Kleidarithmos',
        summary:
            "Give no quarter Blow the man down Batten down the hatches Run.",
        numberofpages: 140,
        category: 'Literature',
        condition: 'Old',
        yearofpurchase: 1997,
        userID: 2);
    await sqLiteService.addBook(beloved);

    Book expectations = Book(
        title: 'Great Expectations',
        author: 'Charles Pickens',
        publisher: 'Arnos',
        summary:
            "Privateer Old salt Booty Crows nest Booty Hempen halter Dead men tell no tales Abaft Poop deck Give no quarter.",
        numberofpages: 235,
        category: 'Comedy',
        condition: 'Used',
        yearofpurchase: 2005,
        userID: 2);
    await sqLiteService.addBook(expectations);

    Book middlemarch = Book(
        title: 'Middlemarch',
        author: 'George Eriot',
        publisher: 'Arnos',
        summary:
            "Shiver me timbers! Shark bait Three sheets to the wind Blow the man down Abaft.",
        numberofpages: 500,
        category: 'Biography',
        condition: 'Used',
        yearofpurchase: 1986,
        userID: 2);
    await sqLiteService.addBook(middlemarch);

    Book iliad = Book(
        title: 'The Iliad',
        author: 'Domer',
        publisher: 'Portokali',
        summary: "Scuttlebutt Jacobs Ladder Heave ho Ahoy Davy Jones Locker.",
        numberofpages: 189,
        category: 'Literature',
        condition: 'Brand New',
        yearofpurchase: 2021,
        userID: 2);
    await sqLiteService.addBook(iliad);

    Book country = Book(
        title: 'Another Country',
        author: 'James Baldlose',
        publisher: 'Portokali',
        summary:
            "All hands hoay Hornswaggle Cutlass Abaft Pieces of eight Head.",
        numberofpages: 232,
        category: 'Art',
        condition: 'Brand New',
        yearofpurchase: 2021,
        userID: 2);
    await sqLiteService.addBook(country);

    Book vanity = Book(
        title: 'Vanity Fair',
        author: 'Kuria Koula',
        publisher: 'Lemoni',
        summary:
            "Hempen halter Cutlass Give no quarter Man-O-War Man-O-War Jacobs Ladder Cutlass Scuttle Scuttle Avast ye!.",
        numberofpages: 248,
        category: 'Fantasy',
        condition: 'Like New',
        yearofpurchase: 2015,
        userID: 2);
    await sqLiteService.addBook(vanity);

    User roula = User(
        username: 'roula',
        fullname: 'roula korosuka',
        password: '1',
        email: 'roula@gmail.com',
        age: 82,
        address: 'Athinwn 41',
        gender: 'Female',
        categories: ['Comedy', 'Mystery', 'Adventure', 'Art']);
    await sqLiteService.addUser(roula);

    Book bell = Book(
        title: 'The Bell Jar',
        author: 'Sylvia Pat',
        publisher: 'Symmetria',
        summary:
            "Ex labore fugiat exercitation enim amet proident ullamco eiusmod incididunt esse cillum id nulla labore proident magna est minim officia laboris consectetur nostrud.",
        numberofpages: 580,
        category: 'Poetry',
        condition: 'Used',
        yearofpurchase: 2001,
        userID: 3);
    await sqLiteService.addBook(bell);

    Book dracula = Book(
        title: 'Dracula',
        author: 'Bram Soccer',
        publisher: 'Psixogios',
        summary:
            "Commodo eu reprehenderit occaecat qui ex in ut laborum minim minim tempor quis eu ea sint consectetur.",
        numberofpages: 360,
        category: 'Mystery',
        condition: 'Like New',
        yearofpurchase: 2006,
        userID: 3);
    await sqLiteService.addBook(dracula);

    User johnli7 = User(
        username: 'johnli7',
        fullname: 'giannis pitsos',
        password: '1',
        email: 'johnli7@gmail.com',
        age: 32,
        address: 'Patrwn 12',
        gender: 'Male',
        categories: ['Comedy', 'Comics', 'Biography', 'Science']);
    await sqLiteService.addUser(johnli7);

    Book treasure = Book(
        title: 'Treasure Island',
        author: 'Robert Stelenson',
        publisher: 'Arnos',
        summary: "Ut veniam sint labore magna.",
        numberofpages: 300,
        category: 'Adventure',
        condition: 'Old',
        yearofpurchase: 1970,
        userID: 4);
    await sqLiteService.addBook(treasure);

    Book war = Book(
        title: 'The Art of War',
        author: 'Sun Tzul',
        publisher: 'Pataki',
        summary:
            "Adipisicing nisi et non non aliqua enim dolor exercitation voluptate officia incididunt eiusmod cillum veniam et ut ex ex amet sit.",
        numberofpages: 100,
        category: 'Kids',
        condition: 'Like New',
        yearofpurchase: 2017,
        userID: 4);
    await sqLiteService.addBook(war);

    Book persuasion = Book(
        title: 'Persuasion',
        author: 'Jane Ausper',
        publisher: 'Tziola',
        summary:
            "Shiver me timbers! Cockswain, coxswain Batten down the hatches Abaft Shark bait.",
        numberofpages: 705,
        category: 'Crime',
        condition: 'Used',
        yearofpurchase: 2017,
        userID: 4);
    await sqLiteService.addBook(persuasion);

    User skatz = User(
        username: 'skatz',
        fullname: 'skatzoxoiros skatzoxoiridis',
        password: '1',
        email: 'skatz@gmail.com',
        age: 15,
        address: 'Ilioupolews 19',
        gender: 'Male',
        categories: ['Biography', 'Art', 'Science', 'Comedy']);
    await sqLiteService.addUser(skatz);

    Book blood = Book(
        title: 'In Cold Blood',
        author: 'Truman Carote',
        publisher: 'Pataki',
        summary: "Coaming All hands hoay Dead men tell no tales.",
        numberofpages: 132,
        category: 'Adventure',
        condition: 'Brand New',
        yearofpurchase: 2022,
        userID: 5);
    await sqLiteService.addBook(blood);

    Book frankenstein = Book(
        title: 'Frankenstein',
        author: 'Mary Shenney',
        publisher: 'Psixogios',
        summary: "Give no quarter Black spot Buccaneer Cutlass.",
        numberofpages: 231,
        category: 'Crime',
        condition: 'Used',
        yearofpurchase: 2010,
        userID: 5);
    await sqLiteService.addBook(frankenstein);
  }
}
