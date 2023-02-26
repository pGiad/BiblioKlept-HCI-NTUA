import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'login_page.dart';

void main() {
  runApp(const BiblioKlept());
}

class BiblioKlept extends StatelessWidget {
  const BiblioKlept({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiblioKlept',
      home: LoginPage(),
    );
  }
}

class User {
  int? id;
  String? username;
  String? fullname;
  String? email;
  String? password;
  String? gender;
  int? age;
  String? address;

  User(
      {this.id,
      this.username,
      this.fullname,
      this.email,
      this.password,
      this.gender,
      this.age,
      this.address});

  User.fromMap(Map<String, dynamic> user)
      : id = user['id'],
        username = user['username'],
        fullname = user['fullname'],
        password = user['password'],
        email = user['email'],
        gender = user['gender'],
        age = user['age'],
        address = user['address'];

  Map<String, dynamic> toMap() {
    final record = {
      'id': id,
      'username': username,
      'fullname': fullname,
      'password': password,
      'email': email,
      'gender': gender,
      'age': age,
      'address': address
    };
    return record;
  }
}

class SQLiteService {
  // DB initialization
  Future<Database> initDB() async {
    return openDatabase(
      p.join(await getDatabasesPath(), 'biblioklept.db'),
      onCreate: (db, version) async {
        // Create users table
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            fullname TEXT,
            password TEXT,
            email TEXT,
            gender TEXT,
            age INTEGER,
            address TEXT
          )
          ''');
      },
      version: 1,
    );
  }

  /*
  ############### USERS ###############
  */

  // Retrieve all users from db
  Future<List<User>> getUsers() async {
    // Connection with db
    final db = await initDB();

    final List<Map<String, Object?>> queryResult = await db.query('users');

    // Convert from db records to class instances
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

  /// Add [User] [user] to db. Returns the primary key of the record.
  Future<int> addUser(User user) async {
    // Connection with db.
    final db = await initDB();

    // In case there is a duplicate record in the database for some reason, replace it with the current one.
    return db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Delete the [User] with [id] from the  db
  Future<void> deleteUser(final id) async {
    // Connection with db
    final db = await initDB();

    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  /// Update [User]
  Future<void> updateUser(User user) async {
    // Connection with db
    final db = await initDB();

    await db.update(
        'users',
        where: 'id = ?',
        user.toMap(),
        whereArgs: [user.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Delete all [User] records from db
  Future<void> deleteAllUsers() async {
    // Connection with db
    final db = await initDB();
    await db.delete('users');
  }

  /*
  ############### EXTRAS ###############
  */

  // returns a list of user's playlists
  // Future<List<Playlist>> getUserPlaylists(User user) async {
  //   final db = await initDB();

  //   final List<Map<String, Object?>> queryResult = await db.query(
  //     'playlists',
  //     where: 'userID = ?',
  //     whereArgs: [user.id],
  //   );

  //   return queryResult.map((e) => Playlist.fromMap(e)).toList();
  // }
}
