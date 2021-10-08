import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Theory extends StatefulWidget {
  const Theory({Key? key}) : super(key: key);

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
      body: MySlot(),
    );
  }
}

class MySlot extends StatefulWidget {
  const MySlot({Key? key}) : super(key: key);

  @override
  _MySlotState createState() => _MySlotState();
}

class _MySlotState extends State<MySlot> {
  String id = '';
  String slot = '';
  void different() async {
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        var subjects = element['subjects'];
        if (subjects.contains('CSI1007')) {
        } else {
          var slots = element['slots'];
          if (slots.contains(id)) {
          } else {
            print(element['faculty_name']);
          }
        }
      });
    });
  }

  void same() async {
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        var subjects = element['subjects'];
        if (subjects.contains('CSI1007')) {
          var slots = element['slots'];
          if (slots.contains(id)) {
          } else {
            print(element['faculty_name']);
          }
        } else {}
      });
    });
  }

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
          child: showSlot(),
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
      return Color(0xffDCD868);
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
                  color: Tile(index, slots[index][1]),
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
            child: Text(
              'PLEASE CHOOSE A SLOT',
            ),
          )
        : Center(
            child: Text('SLOT CHOOSEN :${this.slot}'),
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
              same();
              Navigator.of(context, rootNavigator: true).pop();
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
              different();
              Navigator.of(context, rootNavigator: true).pop();
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
