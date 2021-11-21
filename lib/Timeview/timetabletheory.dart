import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class TimeTable extends StatefulWidget {
  var user;
  var course;
  TimeTable({this.user, this.course});

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
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
        title: Text('THEORY TIMETABLE'),
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
  var subjects;
  var counter = '0';
  // ignore: non_constant_identifier_names
  List slotlist = [];
  Map courses1 = {};
  void store() async {
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (widget.user == element['mail_id']) {
          this.slotlist = element['slots'];
          this.fac = element['faculty_id'];
          this.subjects = element['subjects'];
          List courses = [];
          for (var i = 0; i < subjects.length; i++) {
            courses.add([subjects[i], element[subjects[i]]]);
          }
          courses.forEach((element) {
            element[1].forEach((val) {
              setState(() {
                courses1[val] = element[0];
              });
            });
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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.freepik.com/free-vector/hand-drawn-back-school-timetable_23-2148608172.jpg'),
                    fit: BoxFit.cover)),
            child: (courses1.isEmpty)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                              'REFRESH',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
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
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Color Tile(int index, var id) {
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
      height: 90,
      child: AnimationLimiter(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: slots.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(seconds: 1),
            child: SlideAnimation(
              horizontalOffset: 100.0,
              child: FadeInAnimation(
                child: new Column(
                  children: <Widget>[
                    InkResponse(
                      onTap: () {},
                      child: Container(
                        height: 80,
                        width: 100,
                        child: Card(
                          color: (slot.contains(slots[index][1]) == true)
                              ? Color(0xff66de33)
                              : Tile(index, slots[index][1]),
                          child: Center(
                            child: (courses1.containsKey(slots[index][1]))
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        slots[index][0],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        courses1[slots[index][1]],
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                : Text(slots[index][0]),
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
}
