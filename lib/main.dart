import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystic_app/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.route: (BuildContext context) => LoginPage(),
    HomePage.route: (BuildContext context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mystic App',
      home: LoginPage(),
      routes: routes,
    );
  }
}

class LoginPage extends StatefulWidget {
  static final String route = "login-page";

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInAnon() async {
    FirebaseUser user = await firebaseAuth.signInAnonymously();
    print("Signed in ${user.uid}");
    return user;
  }

  void signOut() {
    firebaseAuth.signOut();
    print('Signed Out!');
  }

  @override
  Widget build(BuildContext context) {
    final loginButton = Container(
      padding: EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.deepOrange,
        elevation: 10.0,
        child: MaterialButton(
            minWidth: 150.0,
            height: 50.0,
            color: Colors.orange,
            child: Text('Login as Guest'),
            onPressed: () {
              signInAnon().then((FirebaseUser user) {
                Navigator
                    .of(context)
                    .push(MaterialPageRoute(
                        builder: (BuildContext context) => HomePage(
                          user: user,
                            )))
                    .catchError((e) => print(e));
              });
            }),
      ),
    );

    final logoutButton = Container(
      padding: EdgeInsets.all(10.0),
      child: FlatButton(
          color: Colors.white,
          onPressed: () {
            signOut();
          },
          child: Text(
            "Sign Out",
            style: TextStyle(color: Colors.black),
          )),
    );

    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            loginButton,
            logoutButton
          ],
        ),
      ),
    );
  }
}
