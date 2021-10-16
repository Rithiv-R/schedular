import 'package:flutter/material.dart';
import 'package:schedular/labslot.dart';
import 'package:schedular/theoryslot.dart';

class MyHomePage extends StatefulWidget {
  var user;
  MyHomePage({this.user});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Theory(
                                  user: widget.user,
                                )));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Lab(
                                  user: widget.user,
                                )));
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
