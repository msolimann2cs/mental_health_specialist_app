import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mental_health/screens/register_screen.dart';

import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = "login_screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final firestore = FirebaseFirestore.instance;
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 150, bottom: 50.0, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Please sign in to continue',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              // Text('Username'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: TextField(
                  onChanged: (value) {
                    username = value;
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              // Text('Password'),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10.0),
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 23.0, left: 230),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      //firestore.collection('users').doc()
                      if (await AuthUser(username, password)) {
                        Navigator.pushNamed(context, MainScreen.id);
                      }
                      ;
                    },
                    child: Container(
                      width: 120,
                      height: 45,
                      decoration: BoxDecoration(
                        color: true ? Colors.blueAccent : Colors.blue[50],
                        border: Border.all(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login  ➜",
                              style: (TextStyle(
                                  color: true ? Colors.white : Colors.blue,
                                  fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> AuthUser(String username, String password) async {
    final users = await GetUsers();
    //for (var v in users.values)
    // users.forEach((key, value) {
    //   print("key" + key);
    //   print("value" + value);
    // } as void Function(Map<String, dynamic> element));
    int index = 0;
    bool isUser = false;
    List<String> usernames = users.fold<List<String>>(
        [], (prev, element) => List.from(prev)..add(element['username']));
    List<String> passwords = users.fold<List<String>>(
        [], (prev, element) => List.from(prev)..add(element['password']));
    for (int i = 0; i < usernames.length; i++) {
      if (usernames.elementAt(i) == username &&
          passwords.elementAt(i) == password) {
        return true;
      }
    }
    return false;
    //print(usernames); // [rabbittoy, mousetoy, cat, dog]
  }

  Future<List<Map<String, dynamic>>> GetUsers() async {
    final snapshot = await firestore.collection('users').get();
    final test_arr = snapshot.docs.map((doc) => doc.data()).toList();
    print(test_arr);
    return test_arr;
    //print(test_arr);
    //for(int i = 0; i < snapshot.)
  }
}
