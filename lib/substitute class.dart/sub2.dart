import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Sub2 extends StatefulWidget {
  var id;
  var slot;
  var course;
  Sub2({required this.id, required this.slot, required this.course});
  @override
  _Extra1State createState() => _Extra1State();
}

class _Extra1State extends State<Sub2> {
  var students = [];
  var unique = [];
  var free = [];
  var slotsof = [
    '2111',
    '2112',
    '2113',
    '2114',
    '2115',
    '2116',
    '2121',
    '2122',
    '2123',
    '2124',
    '2125',
    '2126',
    '2211',
    '2212',
    '2213',
    '2214',
    '2215',
    '2216',
    '2221',
    '2222',
    '2223',
    '2224',
    '2225',
    '2226',
    '2311',
    '2312',
    '2313',
    '2314',
    '2315',
    '2316',
    '2321',
    '2322',
    '2323',
    '2324',
    '2325',
    '2326',
    '2411',
    '2412',
    '2413',
    '2414',
    '2415',
    '2421',
    '2422',
    '2423',
    '2424',
    '2425',
    '2426',
    '2511',
    '2512',
    '2513',
    '2514',
    '2515',
    '2516',
    '2521',
    '2522',
    '2523',
    '2524',
    '2525',
    '2526',
  ];
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
              if (element.startsWith('1')) {
                if (element.endsWith('1') || element.endsWith('5')) {
                  var id1 = '2' +
                      element.substring(
                        1,
                      );
                  if (!unique.contains(id1)) {
                    unique.add(id1);
                  }
                } else if (element.endsWith('6')) {
                } else {
                  var id1 = '2' +
                      element.substring(
                        1,
                      );
                  var id2 = '2' +
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
        if (element.startsWith('1')) {
          if (element.endsWith('1') || element.endsWith('5')) {
            var id1 = '2' +
                element.substring(
                  1,
                );
            if (!unique.contains(id1)) {
              unique.add(id1);
            }
          } else if (element.endsWith('6')) {
          } else {
            var id1 = '2' +
                element.substring(
                  1,
                );
            var id2 = '2' +
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
        title: Text('SUBSTITUTE LAB FREE SLOTS'),
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
