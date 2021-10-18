import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedular/main.dart';

import 'package:schedular/Timeview/timetabletheory.dart';
import 'package:schedular/Timeview/timetablelab.dart';

class HomeStart extends StatefulWidget {
  var user;
  HomeStart({this.user});
  @override
  _HomeStartState createState() => _HomeStartState();
}

class _HomeStartState extends State<HomeStart> {
  List<String> slotlist = [];
  String id = "";
  String course = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  var loading = false;
  Color color1 = Color(0xff4f6ff0);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        title: Text('TIMETABLE VIEW'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyMainPage()));
              },
              icon: Icon(Icons.logout_sharp)),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeTable(
                                  user: widget.user,
                                  course: course,
                                )));
                  },
                  color: color1,
                  child: Container(
                      height: 50,
                      width: 300,
                      child: Center(
                          child: Text('Theory-TimeTable',
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
                            builder: (context) => TimeTable1(
                                  user: widget.user,
                                  course: course,
                                )));
                  },
                  color: color1,
                  child: Container(
                      height: 50,
                      width: 300,
                      child: Center(
                          child: Text('Lab-TimeTable',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))))),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
