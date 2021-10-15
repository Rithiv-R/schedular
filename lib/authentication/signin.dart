import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedular/authentication/signup.dart';
import 'package:schedular/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  String password = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.orange, child: Text('Sign-In')),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  email = value.trim();
                });
              },
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'password',
              ),
              onChanged: (value) {
                setState(() {
                  password = value.trim();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('Sign-In'),
                    onPressed: () {
                      auth
                          .signInWithEmailAndPassword(
                              email: email, password: password)
                          .then((_) =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              )));
                    }),
                RaisedButton(
                    child: Text('Sign-Up'),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
