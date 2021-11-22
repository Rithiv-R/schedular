import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Sub1 extends StatefulWidget {
  var id;
  var slot;
  var course;
  Sub1({required this.id, required this.slot, required this.course});
  @override
  _Extra1State createState() => _Extra1State();
}

class _Extra1State extends State<Sub1> {
  var students = [];
  var unique = [];
  var free = [];
  var slotsof = [
    '1111',
    '1112',
    '1113',
    '1114',
    '1115',
    '1121',
    '1122',
    '1123',
    '1124',
    '1125',
    '1211',
    '1212',
    '1213',
    '1214',
    '1215',
    '1221',
    '1222',
    '1223',
    '1224',
    '1225',
    '1311',
    '1312',
    '1313',
    '1314',
    '1315',
    '1321',
    '1322',
    '1323',
    '1324',
    '1325',
    '1411',
    '1412',
    '1413',
    '1414',
    '1415',
    '1421',
    '1422',
    '1423',
    '1424',
    '1425',
    '1511',
    '1512',
    '1513',
    '1514',
    '1515',
    '1521',
    '1522',
    '1523',
    '1524',
    '1525',
  ];
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mystore();
    myfac();
  }

  void mystore() async {
    FirebaseFirestore.instance
        .collection('class')
        .doc(widget.id)
        .collection(widget.course)
        .doc(widget.slot)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        students = documentSnapshot['reg-no'];
        students.forEach((element) async {
          await FirebaseFirestore.instance
              .collection('students')
              .doc(element)
              .get()
              .then((DocumentSnapshot documentSnapshot1) {
            List x = documentSnapshot1['slots'];
            x.forEach((element) {
              if (element.startsWith('2')) {
                if (element.endsWith('1')) {
                  var id1 = '1' +
                      element.substring(
                        1,
                      );
                  if (!unique.contains(id1)) {
                    unique.add(id1);
                  }
                } else {
                  var id1 = '1' +
                      element.substring(
                        1,
                      );
                  var id2 = '1' +
                      element.substring(1, 3) +
                      (int.parse(element.substring(
                                3,
                              )) +
                              1)
                          .toString();
                  if (!unique.contains(id1)) {
                    unique.add(id1);
                  }
                  if (!unique.contains(id2)) {
                    unique.add(id2);
                  }
                }
              } else {
                if (!unique.contains(element)) {
                  unique.add(element);
                }
              }
            });
            /*x.forEach((element) {
              if (unique.contains(element)) {
              } else {
                unique.add(element);
              }
            });*/
          });
        });
      });
    });
  }

  void myfac() async {
    FirebaseFirestore.instance
        .collection('faculties')
        .doc(widget.id)
        .get()
        .then((value) {
      List sl = value['slots'];
      sl.forEach((element) {
        if (element.startsWith('2')) {
          if (element.endsWith('1')) {
            var id1 = '1' +
                element.substring(
                  1,
                );
            if (!unique.contains(id1)) {
              unique.add(id1);
            }
          } else {
            var id1 = '1' +
                element.substring(
                  1,
                );
            var id2 = '1' +
                element.substring(1, 3) +
                (int.parse(element.substring(
                          3,
                        )) +
                        1)
                    .toString();
            if (!unique.contains(id1)) {
              unique.add(id1);
            }
            if (!unique.contains(id2)) {
              unique.add(id2);
            }
          }
        } else {
          if (!unique.contains(element)) {
            unique.add(element);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
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
        title: Text('SUBSTITUTE THEORY FREE SLOTS'),
      ),
      body: (students.isEmpty)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: <Widget>[
                      (free.isEmpty)
                          ? Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.freepik.com/free-photo/hand-painted-watercolor-background-with-sky-clouds-shape_24972-1095.jpg'),
                                      fit: BoxFit.cover)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(left: 20)),
                                      MaterialButton(
                                        elevation: 5,
                                        height: 45,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.lightBlueAccent,
                                        onPressed: () {
                                          slotsof.forEach((element) {
                                            if (!unique.contains(element)) {
                                              setState(() {
                                                free.add(element);
                                              });
                                            }
                                          });
                                        },
                                        child: Text(
                                          'REFRESH',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 30)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
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
                                      Padding(
                                          padding: EdgeInsets.only(top: 10)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20)),
                                          MaterialButton(
                                            elevation: 5,
                                            height: 45,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            color: Colors.lightBlueAccent,
                                            onPressed: () {
                                              slotsof.forEach((element) {
                                                if (!unique.contains(element)) {
                                                  setState(() {
                                                    free.add(element);
                                                  });
                                                }
                                              });
                                            },
                                            child: Text(
                                              'REFRESH',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 30)),
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
                    ],
                  ),
                ),
              ],
            )),
    );
  }

  Color Tile(int index, var id) {
    if (index == 0) {
      return Colors.grey;
    } else if (index == 7) {
      return Color(0xffDDA8F3);
    } else {
      if (free.contains(id)) {
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

  Widget TimeTable(var slotsz) {
    return Container(
      height: 90,
      child: AnimationLimiter(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: slotsz.length,
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
                          color: (free.contains(slotsz[index][1]) == true)
                              ? Color(0xff66de33)
                              : Tile(index, slotsz[index][1]),
                          child: Center(
                            child: Text(slotsz[index][0]),
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
