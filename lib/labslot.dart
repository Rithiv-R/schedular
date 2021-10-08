import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Lab extends StatefulWidget {
  const Lab({Key? key}) : super(key: key);

  @override
  _LabState createState() => _LabState();
}

class _LabState extends State<Lab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Slot Substitution'),
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
  String id1 = '';
  String slot = '';
  String slot1 = '';
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
      ['L1', '2111'],
      ['L2', '2112'],
      ['L3', '2113'],
      ['L4', '2114'],
      ['L5', '2115'],
      ['L6', '2116'],
      ['Lunch', 'null'],
      ['L31', '	2121'],
      ['L32', '2122'],
      ['L33', '2123'],
      ['L34', '2124'],
      ['L35', '2125'],
      ['L36', '2126'],
      ['-', 'null'],
    ];
    var slots2 = [
      ['Tuesday', 'null'],
      ['L7', '2211'],
      ['L8', '2212'],
      ['L9', '2213'],
      ['L10', '2214'],
      ['L11', '2215'],
      ['L12', '2216'],
      ['Lunch', 'null'],
      ['L37', '2221'],
      ['L38', '2222'],
      ['L39', '2223'],
      ['L40', '2224'],
      ['L41', '2225'],
      ['L42', '2226'],
      ['-', 'null'],
    ];
    var slots3 = [
      ['Wednesday', 'null'],
      ['L13', '2311'],
      ['L14', '2312'],
      ['L15', '2313'],
      ['L16', '2314'],
      ['L17', '2315'],
      ['L18', '2316'],
      ['Lunch', 'null'],
      ['L43', '2321'],
      ['L44', '2322'],
      ['L45', '2323'],
      ['L46', '2324'],
      ['L47', '2325'],
      ['L48', '2326'],
      ['-', 'null'],
    ];
    var slots4 = [
      ['Thursday', 'null'],
      ['L19', '2411'],
      ['L20', '2412'],
      ['L21', '2413'],
      ['L22', '2414'],
      ['L23', '2415'],
      ['L24', '2416'],
      ['Lunch', 'null'],
      ['L49', '2421'],
      ['L50', '2422'],
      ['L51', '2423'],
      ['L52', '2424'],
      ['L53', '2425'],
      ['L54', '2426'],
      ['-', 'null'],
    ];
    var slots5 = [
      ['Friday', 'null'],
      ['L25', '2511'],
      ['L26', '2512'],
      ['L27', '2513'],
      ['L28', '2514'],
      ['L29', '2515'],
      ['L30', '2516'],
      ['Lunch', 'null'],
      ['L55', '2521'],
      ['L56', '2522'],
      ['L57', '2523'],
      ['L58', '2524'],
      ['L59', '2525'],
      ['L60', '2526'],
      ['-', 'null'],
    ];
    var time = [
      'DAYS',
      '8:00-8:50',
      '8:51-9:40',
      '9:51-10:40',
      '10:41-11:30',
      '11:40-12:30',
      '12:31-13:20',
      'Lunch',
      '14:00-14:50',
      '14:51-15:40',
      '15:51-16:40',
      '16:41-17:30',
      '17:40-18:30',
      '18:31-19:20',
      '-',
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
    if ((this.id == id || this.id1 == id) &&
        this.id != 'null' &&
        this.id1 != 'null') {
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
                var val1;
                if (index > 0 && index < 7) {
                  if (index % 2 != 0) {
                    val1 = index + 1;
                  } else {
                    val1 = index - 1;
                  }
                  _slotfinder(slots[index][1], slots[index][0], slots[val1][1],
                      slots[val1][0]);
                } else if (index > 7 && index < 14) {
                  if (index % 2 == 0) {
                    val1 = index + 1;
                  } else {
                    val1 = index - 1;
                  }
                  _slotfinder(slots[index][1], slots[index][0], slots[val1][1],
                      slots[val1][0]);
                }
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

  void _slotfinder(var value, var slot, var valu1, var slot1) {
    print(value);
    setState(() {
      this.id = value;
      this.id1 = valu1;
      if (value != 'null') {
        this.slot = slot;
        this.slot1 = slot1;
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
