import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schedular/displaylist/theorydiff.dart';

import 'displaylist/theorysame.dart';
import 'models.dart';

// ignore: must_be_immutable
class Theory extends StatefulWidget {
  var user;
  Theory({this.user});

  @override
  _TheoryState createState() => _TheoryState();
}

class _TheoryState extends State<Theory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theory Slot Substitution'),
      ),
      body: MySlot(user: widget.user),
    );
  }
}

// ignore: must_be_immutable
class MySlot extends StatefulWidget {
  var user;
  MySlot({this.user});

  @override
  _MySlotState createState() => _MySlotState();
}

class _MySlotState extends State<MySlot> {
  String id = '';
  String slot = '';
  String fac = '';
  var counter = '0';
  // ignore: non_constant_identifier_names
  List<Theory_same> theory_same = [];
  // ignore: non_constant_identifier_names
  List<Theory_diff> theory_diff = [];
  List slotlist = [];
  void different() async {
    var id1 = '2' +
        id.substring(
          1,
        );
    var id2 = '2' +
        id.substring(1, 3) +
        (int.parse(id.substring(
                  3,
                )) +
                1)
            .toString();
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        var subjects = element['subjects'];
        if (subjects.contains('CSI1007')) {
        } else {
          var slots = element['slots'];
          if (slots.contains(id) ||
              slots.contains(id1) ||
              slots.contains(id2)) {
          } else {
            setState(() {
              if (element['faculty_id'] == fac) {
              } else {
                Theory_diff lb = Theory_diff(
                  name: element['faculty_name'],
                  photo: element['faculty_pic'],
                  facid: element['faculty_id'],
                );
                theory_diff.add(lb);
              }
            });
            print(element['faculty_name']);
          }
        }
      });
    });
  }

  void same() async {
    var id1 = '2' +
        id.substring(
          1,
        );
    var id2 = '2' +
        id.substring(1, 3) +
        (int.parse(id.substring(
                  3,
                )) +
                1)
            .toString();
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        var subjects = element['subjects'];
        if (subjects.contains('CSI1007')) {
          var slots = element['slots'];
          var faculty_id = element['faculty_id'];
          if (slots.contains(id) ||
              slots.contains(id1) ||
              slots.contains(id2)) {
          } else if (faculty_id == fac) {
          } else {
            setState(() {
              Theory_same lb1 = Theory_same(
                name: element['faculty_name'],
                photo: element['faculty_pic'],
                facid: element['faculty_id'],
              );
              theory_same.add(lb1);
            });
          }
        } else {}
      });
    });
  }

  // ignore: unused_element
  void _overall() async {
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        var slots = element['slots'];
        if (slots.contains(id)) {
        } else {
          print(element['faculty_name']);
        }
      });
    });
  }

  void store() async {
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (widget.user == element['mail_id']) {
          this.slotlist = element['slots'];
          this.fac = element['faculty_id'];
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
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1501349800519-48093d60bde0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showSlot(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        this.slot = "";
                        this.id = "";
                      });
                    },
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'CLEAR SLOT',
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
                    theory_same = [];
                    same();
                    SameFaculty(context);
                  },
                  color: Color(0xff4f6ff0),
                  child: Container(
                      height: 50,
                      width: 300,
                      child: Center(
                          child: Text('SUBSTITUTION FROM SAME COURSE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))))),
              Padding(padding: EdgeInsets.only(top: 30)),
              FlatButton(
                  onPressed: () {
                    theory_diff = [];
                    different();
                    DiffFaculty(context);
                  },
                  color: Color(0xff4f6ff0),
                  child: Container(
                      height: 50,
                      width: 300,
                      child: Center(
                          child: Text('SUBSTITUTION FROM DIFFERENT COURSE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))))),
            ],
          ),
        ),
      ],
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
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: slots.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => new Column(
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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

  void SameFaculty(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text(
          'Message Confirmation!',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text('Are you sure to Substitution from Same Course Faculty?'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Container(
              height: 20,
              width: 25,
              child: Text(
                'NO',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              this.counter = (this.slotlist.contains(this.id)) ? '1' : '0';
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Same_Fac_Theory(
                            list: theory_same,
                            counter: counter,
                          )));
            },
            child: Text(
              'YES',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ]);
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void DiffFaculty(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text(
          'Message Confirmation!',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(
            'Are you sure to get Substitution from Different Course Faculty?'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Container(
              height: 20,
              width: 25,
              child: Text(
                'NO',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Diff_Fac_Theory(list: theory_diff)));
            },
            child: Text(
              'YES',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ]);
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
