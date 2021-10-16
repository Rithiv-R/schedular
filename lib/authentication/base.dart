import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedular/home.dart';

class MyBase extends StatefulWidget {
  const MyBase({Key? key}) : super(key: key);

  @override
  _MyBaseState createState() => _MyBaseState();
}

class _MyBaseState extends State<MyBase> {
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
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
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
                height: 60,
                minWidth: 200,
                child: Text(
                  "FIND SUBSTITUTE FACULTY",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                color: Colors.orangeAccent,
                splashColor: Colors.deepOrange,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyHomePage(user: email),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
