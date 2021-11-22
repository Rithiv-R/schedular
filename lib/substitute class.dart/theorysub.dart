import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:schedular/main.dart';
import 'package:schedular/substitute%20class.dart/sub1.dart';

class Theorysub extends StatefulWidget {
  var user;
  var course;
  Theorysub({required this.user, required this.course});
  @override
  _TheoryextraState createState() => _TheoryextraState();
}

class _TheoryextraState extends State<Theorysub> {
  @override
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
        title: Text('THEORY SUBSTITUTE CLASS'),
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
      body: MySlot(
        user: widget.user,
        course: widget.course,
      ),
    );
  }
}

// ignore: must_be_immutable
class MySlot extends StatefulWidget {
  var user;
  var course;
  MySlot({this.user, this.course});

  @override
  _MySlotState createState() => _MySlotState();
}

class _MySlotState extends State<MySlot> {
  String id = '';
  String slot = '';
  String fac = '';
  var counter = '0';
  List slotlist = [];

  void store() async {
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (widget.user == element['mail_id']) {
          setState(() {
            this.slotlist = element[widget.course];
            this.fac = element['faculty_id'];
          });
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store();
  }

  @override
  Widget build(BuildContext context) {
    var slots1 = [
      ['Monday', 'null'],
      ['A1', '1111'],
      ['F1', '1112'],
      ['D1', '1113'],
      ['TB1', '1114'],
      ['TG1', '1115'],
      ['-', 'null'],
      ['Lunch', 'null'],
      ['A2', '1121'],
      ['F2', '1122'],
      ['D2', '1123'],
      ['TB2', '1124'],
      ['TG2', '1125'],
      ['-', 'null'],
      ['V3', 'null'],
    ];
    var slots2 = [
      ['Tuesday', 'null'],
      ['B1', '1211'],
      ['G1', '1212'],
      ['E1', '1213'],
      ['TC1', '1214'],
      ['TAA1', '1215'],
      ['-', 'null'],
      ['Lunch', 'null'],
      ['B2', '1221'],
      ['G2', '1222'],
      ['E2', '1223'],
      ['TC2', '1224'],
      ['TAA2', '1225'],
      ['-', 'null'],
      ['V4', 'null'],
    ];
    var slots3 = [
      ['Wednesday', 'null'],
      ['C1', '1311'],
      ['A1', '1312'],
      ['F1', '1313'],
      ['V1', 'null'],
      ['V2', 'null'],
      ['-', 'null'],
      ['Lunch', 'null'],
      ['C2', '1321'],
      ['A2', '1322'],
      ['F2', '1323'],
      ['TD2', '1324'],
      ['TBB2', '1325'],
      ['-', 'null'],
      ['V5', 'null'],
    ];
    var slots4 = [
      ['Thursday', 'null'],
      ['D1', '1411'],
      ['B1', '1412'],
      ['G1', '1413'],
      ['TE1', '1414'],
      ['TCC1', '1415'],
      ['-', 'null'],
      ['Lunch', 'null'],
      ['D2', '1421'],
      ['B2', '1422'],
      ['G2', '1423'],
      ['TE1', '1424'],
      ['TCC2', '1425'],
      ['-', 'null'],
      ['V6', 'null'],
    ];
    var slots5 = [
      ['Friday', 'null'],
      ['E1', '1511'],
      ['C1', '1512'],
      ['TA1', '1513'],
      ['TF1', '1514'],
      ['TD1', '1515'],
      ['-', 'null'],
      ['Lunch', 'null'],
      ['E2', '1521'],
      ['C2', '1522'],
      ['TA2', '1523'],
      ['TF2', '1524'],
      ['TD2', '1525'],
      ['-', 'null'],
      ['V7', 'null'],
    ];
    var time = [
      'DAYS',
      '8:00-8:50',
      '9:00-9:50',
      '10:00-10:50',
      '11:00-11:50',
      '12:00-12:50',
      '-',
      'Lunch',
      '14:00-14:50',
      '15:00-15:50',
      '16:00-16:50',
      '17:00-17:50',
      '18:00-18:50',
      '18:51-19:00',
      '19:01-19:50',
    ];
    return (slotlist.isNotEmpty)
        ? Column(
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.freepik.com/free-photo/hand-painted-watercolor-background-with-sky-clouds-shape_24972-1095.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    showSlot(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 20)),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              this.slot = "";
                              this.id = "";
                            });
                          },
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'REFRESH',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          color: Colors.blue,
                        ),
                        Padding(padding: EdgeInsets.only(right: 30)),
                      ],
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Timings(time),
                        TimeTable(slots1),
                        TimeTable(slots2),
                        TimeTable(slots3),
                        TimeTable(slots4),
                        TimeTable(slots5),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          if (slotlist.contains(id)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Sub1(
                                    slot: this.slot,
                                    id: this.fac,
                                    course: widget.course,
                                  ),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.redAccent,
                                content: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'You don\'t have slot : ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text(
                                          '$slot',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          ' for the ${widget.course}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        color: Color(0xff4f6ff0),
                        child: Container(
                            height: 50,
                            width: 300,
                            child: Center(
                                child: Text('FREE SLOTS FOR SUBSTITUTE CLASS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ))))),
                    Padding(padding: EdgeInsets.only(top: 30)),
                  ],
                ),
              ),
            ],
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  // ignore: non_constant_identifier_names
  Color Tile(int index, var id) {
    if (this.id == id && this.id != 'null') {
      return Colors.red;
    }
    if (index == 0) {
      return Colors.grey;
    } else if (index == 7) {
      return Color(0xffDDA8F3);
    } else {
      if (slotlist.contains(id)) {
        return Color(0xff66de33);
      } else {
        return Color(0xffDCD868);
      }
    }
  }

  Color Tile1(int index) {
    if (index == 0) {
      return Colors.grey;
    } else {
      return Color(0xfffcb64c);
    }
  }

  Widget Timings(List<String> slots) {
    return Container(
      height: 60,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: slots.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => new Column(
          children: <Widget>[
            Container(
              height: 60,
              width: 100,
              child: Card(
                elevation: 1,
                color: Tile1(index),
                child: Center(
                  child: Text(slots[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget TimeTable(var slots) {
    return Container(
      height: 70,
      child: AnimationLimiter(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: slots.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(seconds: 1),
            child: SlideAnimation(
              horizontalOffset: 100.0,
              child: FadeInAnimation(
                child: new Column(
                  children: <Widget>[
                    InkResponse(
                      onTap: () {
                        _slotfinder(slots[index][1], slots[index][0]);
                      },
                      child: Container(
                        height: 70,
                        width: 100,
                        child: Card(
                          color: (slot.contains(slots[index][1]) == true)
                              ? Color(0xff66de33)
                              : Tile(index, slots[index][1]),
                          child: Center(
                            child: Text(slots[index][0]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _slotfinder(var value, var slot) {
    print(value);
    setState(() {
      id = value;
      if (value != 'null') {
        this.slot = slot;
      }
    });
  }

  Widget showSlot() {
    return (slot == '' || slot == 'null' || slot == '-' || slot.startsWith('V'))
        ? Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  'PLEASE CHOOSE A SLOT',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 20)),
              ],
            ),
          )
        : Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  'SLOT CHOOSEN :',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  '${this.slot}',
                  style: TextStyle(
                    color: (this.slotlist.contains(this.id))
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
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
