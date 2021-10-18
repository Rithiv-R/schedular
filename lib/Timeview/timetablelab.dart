import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schedular/substitute%20faculty.dart/models.dart';

// ignore: must_be_immutable
class TimeTable1 extends StatefulWidget {
  var user;
  var course;
  TimeTable1({this.user, this.course});

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable1> {
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
        title: Text('LAB TIMETABLE'),
      ),
      body: MySlot(user: widget.user, course: widget.course),
    );
  }
}

class MySlot extends StatefulWidget {
  var user;
  var course;
  MySlot({this.user, this.course});
  @override
  _MySlotState createState() => _MySlotState();
}

class _MySlotState extends State<MySlot> {
  String id = '';
  String id1 = '';
  String slot = '';
  String slot1 = '';
  var counter = '0';
  // ignore: non_constant_identifier_names
  List<Lab_diff> lab_diff = [];
  // ignore: non_constant_identifier_names
  List<Lab_same> lab_same = [];
  String fac = '';
  List slotlist = [];
  Map courses1 = {};
  List subjects = [];

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
              courses1[val] = element[0];
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
                      'https://image.freepik.com/free-vector/hand-drawn-back-school-timetable_23-2148608172.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      print(courses1);
                      setState(() {
                        this.slot = "";
                        this.slot1 = "";
                        this.id = "";
                        this.id1 = "";
                      });
                    },
                    child: Text(
                      'REFRESH',
                      style: TextStyle(color: Colors.white),
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
                setState(() {
                  slot = '';
                  slot1 = '';
                  id = '';
                  id1 = '';
                });
              },
              child: Container(
                height: 70,
                width: 100,
                child: Card(
                  color: (slot.contains(slots[index][1]))
                      ? Color(0xff66de33)
                      : Tile(index, slots[index][1]),
                  child: Center(
                    child: (courses1.containsKey(slots[index][1]))
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                slots[index][0],
                                style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
