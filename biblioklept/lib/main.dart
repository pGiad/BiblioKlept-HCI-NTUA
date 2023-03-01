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
  List<String>? categories;

  User(
      {this.id,
      this.username,
      this.fullname,
      this.email,
      this.password,
      this.gender,
      this.age,
      this.address,
      this.categories});

  User.fromMap(Map<String, dynamic> user)
      : id = user['id'],
        username = user['username'],
        fullname = user['fullname'],
        password = user['password'],
        email = user['email'],
        gender = user['gender'],
        age = user['age'],
        address = user['address'],
        categories = (user['categories'] as String?)?.split(',');

  Map<String, dynamic> toMap() {
    final record = {
      'id': id,
      'username': username,
      'fullname': fullname,
      'password': password,
      'email': email,
      'gender': gender,
      'age': age,
      'address': address,
      'categories': categories?.join(','),
    };
    return record;
  }
}

class Book {
  int? id;
  String? title;
  String? author;
  String? publisher;
  String? summary;
  int? numberofpages;
  String? category;
  String? condition;
  int? yearofpurchase;
  int? userID;

  Book(
      {this.id,
      this.title,
      this.author,
      this.publisher,
      this.summary,
      this.numberofpages,
      this.category,
      this.condition,
      this.yearofpurchase,
      this.userID});

  Book.fromMap(Map<String, dynamic> book)
      : id = book['id'],
        title = book['title'],
        author = book['author'],
        publisher = book['publisher'],
        summary = book['summary'],
        numberofpages = book['numberofpages'],
        category = book['category'],
        condition = book['condition'],
        yearofpurchase = book['yearofpurchase'],
        userID = book['userID'];

  Map<String, dynamic> toMap() {
    final record = {
      'id': id,
      'title': title,
      'author': author,
      'publisher': publisher,
      'summary': summary,
      'numberofpages': numberofpages,
      'category': category,
      'condition': condition,
      'yearofpurchase': yearofpurchase,
      'userID': userID
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
            address TEXT,
            categories TEXT
          )
          ''');
        // Create book table
        await db.execute('''
          CREATE TABLE book (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            author TEXT,
            publisher TEXT,
            summary TEXT,
            numberofpages INTEGER,
            category TEXT,
            condition TEXT,
            yearofpurchase INTEGER,
            userID INTEGER,
            FOREIGN KEY (userID) REFERENCES users(id)
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

  Future<User?> getUserById(int id) async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) {
      return null;
    }
    return User.fromMap(maps.first);
  }

  Future<List<String>> getUserCategories(int userId) async {
    final db = await initDB();
    final results = await db
        .rawQuery('SELECT categories FROM users WHERE id = ?', [userId]);
    final categories = results.first['categories'] as String;
    return categories.split(',');
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
############### BOOK ###############
*/

// Retrieve all book from db
  Future<List<Book>> getBooks() async {
    // Connection with db
    final db = await initDB();

    final List<Map<String, Object?>> queryResult = await db.query('book');

    // Convert from db records to class instances
    return queryResult.map((e) => Book.fromMap(e)).toList();
  }

  Future<List<Book>> getBooksForUser(int? userID) async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query(
      'book',
      where: 'userID = ?',
      whereArgs: [userID],
    );
    return List.generate(maps.length, (i) {
      return Book.fromMap(maps[i]);
    });
  }

  Future<List<Book>> getBooksNotOwnedByUser(int userID) async {
    final db = await initDB();

    final List<Map<String, dynamic>> maps = await db.query(
      'book',
      where: 'userID != ?',
      whereArgs: [userID],
    );

    return List.generate(maps.length, (i) {
      return Book.fromMap(maps[i]);
    });
  }

  Future<List<Book>> getBooksByCategories(
      List<String> categories, int userID) async {
    final db = await initDB();

    final result = await db.query(
      'book',
      where:
          'category IN (${categories.map((c) => '?').join(',')}) AND userID != ?',
      whereArgs: [...categories, userID],
    );

    return result.map((json) => Book.fromMap(json)).toList();
  }

  Future<List<Book>> searchBooks(String query) async {
    final db = await initDB();

    final result = await db.query(
      'book',
      where:
          'title LIKE ? OR author LIKE ? OR category LIKE ? OR condition LIKE ?',
      whereArgs: ['%$query%', '%$query%', '%$query%', '%$query%'],
    );

    return result.map((e) => Book.fromMap(e)).toList();
  }

  /// Add [Book] [Book] to db. Returns the primary key of the record.
  Future<int> addBook(Book book) async {
    // Connection with db.
    final db = await initDB();

    // In case there is a duplicate record in the database for some reason, replace it with the current one.
    return db.insert('book', book.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Delete the [Book] with [id] from the  db
  Future<void> deleteBook(final id) async {
    // Connection with db
    final db = await initDB();

    await db.delete('book', where: 'id = ?', whereArgs: [id]);
  }

  /// Update [Book]
  Future<void> updateBook(Book book) async {
    // Connection with db
    final db = await initDB();

    await db.update(
        'book',
        where: 'id = ?',
        book.toMap(),
        whereArgs: [book.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Delete all [Book] records from db
  Future<void> deleteAllBook() async {
    // Connection with db
    final db = await initDB();
    await db.delete('book');
  }
}
