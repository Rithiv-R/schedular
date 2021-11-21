import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedular/extra%20class/Labex.dart';
import 'package:schedular/extra%20class/Theoryex.dart';
import 'package:schedular/main.dart';

class Myselection extends StatefulWidget {
  var user;
  Myselection({this.user});

  @override
  _MyselectionState createState() => _MyselectionState();
}

class _MyselectionState extends State<Myselection> {
  List<String> slotlist = [];
  String id = "";
  String course = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store();
  }

  void store() async {
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (widget.user == element['mail_id']) {
          var values = element['subjects'];
          for (var i = 0; i < values.length; i++) {
            setState(() {
              slotlist.add(values[i]);
            });
          }
        }
      });
    });
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
        title: Text('EXTRA CLASS'),
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
      body: (slotlist.isNotEmpty)
          ? Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: showSlot(),
                      trailing: MaterialButton(
                        onPressed: () {
                          setState(() {
                            this.course = '';
                          });
                        },
                        child: Text('REFRESH'),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Theoryextra(
                                        user: widget.user,
                                        course: course,
                                      )));
                        },
                        color: color1,
                        child: Container(
                            height: 50,
                            width: 300,
                            child: Center(
                                child: Text('EXTRA CLASS FOR THEORY',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ))))),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Labextra(
                                        user: widget.user,
                                        course: course,
                                      )));
                        },
                        color: color1,
                        child: Container(
                            height: 50,
                            width: 300,
                            child: Center(
                                child: Text('EXTRA CLASS FOR LAB',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ))))),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: Container(
                      child: ListView.builder(
                          itemCount: slotlist.length,
                          itemBuilder: (context, index) =>
                              Column(children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      this.course = slotlist[index];
                                    });
                                  },
                                  child: Container(
                                      child: Card(
                                    color: (course == slotlist[index])
                                        ? Colors.orangeAccent
                                        : Colors.white,
                                    elevation: 1,
                                    child: ListTile(
                                      title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(slotlist[index])
                                          ]),
                                    ),
                                  )),
                                ),
                              ])),
                    ))
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget showSlot() {
    return (course == '')
        ? Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'CHOOSE A COURSE',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 20)),
              ],
            ),
          )
        : Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Choosen :',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Text(
                  '$course',
                  style: TextStyle(
                    color: (this.slotlist.contains(this.id))
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                ),
              ],
            ),
          );
  }
}
