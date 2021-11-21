import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedular/extra%20class/slotbooking.dart';
import 'package:unique_list/unique_list.dart';

class Extra1 extends StatefulWidget {
  var id;
  var slot;
  var course;
  Extra1({required this.id, required this.slot, required this.course});
  @override
  _Extra1State createState() => _Extra1State();
}

class _Extra1State extends State<Extra1> {
  var students = [];
  var unique = [];
  var free = [];
  var slots1 = [
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mystore();
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
              if (unique.contains(element)) {
              } else {
                unique.add(element);
              }
            });
          });
        });
      });
    });
    FirebaseFirestore.instance
        .collection('faculties')
        .doc(widget.id)
        .get()
        .then((value) {
      List x = value['slots'];
      x.forEach((element) {
        if (unique.contains(element)) {
        } else {
          unique.add(element);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
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
        title: Text('EXTRA CLASS'),
      ),
      body: (students.isEmpty)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Extra Class Scheduling',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Card(
                        color: Color.fromRGBO(255, 165, 0, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Slot',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Week Day',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              MaterialButton(
                                elevation: 5,
                                height: 45,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.lightBlueAccent,
                                onPressed: () {
                                  slots1.forEach((element) {
                                    if (unique.contains(element)) {
                                    } else {
                                      setState(() {
                                        free.add(element);
                                      });
                                    }
                                  });
                                },
                                child: Text(
                                  'Book Slot',
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      (free.isEmpty)
                          ? Container(
                              child: Text(''),
                            )
                          : Container(
                              child: Text('$free'),
                            )
                    ],
                  ),
                ),
              ],
            )),
    );
  }
}
