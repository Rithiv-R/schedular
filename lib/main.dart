import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schedular/labslot.dart';
import 'package:schedular/theoryslot.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var loading = false;
  Color color1 = Color(0xff4f6ff0);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Substitute Faculty'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Theory()));
                  },
                  color: color1,
                  child: Container(
                      height: 50,
                      width: 300,
                      child: Center(
                          child: Text('FIND SUBSTITUTION FOR THEORY SLOT',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))))),
              Padding(padding: EdgeInsets.only(top: 20)),
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Lab()));
                  },
                  color: color1,
                  child: Container(
                      height: 50,
                      width: 300,
                      child: Center(
                          child: Text('FIND SUBSTITUTION FOR LAB SLOT',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))))),
            ],
          ),
        ),
      ),
    );
  }
}
