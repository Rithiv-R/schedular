import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedular/main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "";
  String password = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.orange, child: Text('Sign-Up')),
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
            RaisedButton(
                child: Text('Register'),
                onPressed: () {
                  Checker();
                })
          ],
        ),
      ),
    );
  }

  void Checker() async {
    var counter = 0;
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (element['mail_id'] == email) {
          counter = 1;
          password = element['password'];
        }
      });
    });
    if (counter == 1) {
      auth.createUserWithEmailAndPassword(email: email, password: password);
      auth.sendPasswordResetEmail(email: email);
      Navigator.of(context).pop();
    }
  }
}
