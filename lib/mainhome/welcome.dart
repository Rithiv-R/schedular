import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedular/Timeview/Homestart.dart';
import 'package:schedular/extra%20class/extra1.dart';
import 'package:schedular/main.dart';
import 'package:schedular/requestmod/sreqmodel.dart';
import 'package:schedular/substitute%20class.dart/sClass2.dart';
import 'package:schedular/substitute%20faculty.dart/home.dart';
import 'package:schedular/profile/facultyprofile.dart';
import 'package:schedular/requestmod/requestHome.dart';

class Welcome extends StatefulWidget {
  var user;
  Welcome({required this.user});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  var facid;
  var phone;
  var name;
  var designation;
  var photo;
  var email;
  var school;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getter();
  }

  void getter() async {
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (widget.user == element['mail_id']) {
          facid = element['faculty_id'];
          phone = element['phone_no'];
          name = element['faculty_name'];
          photo = element['faculty_pic'];
          designation = element['designation'];
          email = widget.user;
          school = element['school'];
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
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyMainPage()));
            }),
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
        title: Text('Education Scheduler'),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      primary: true,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeStart(
                                          user: widget.user,
                                        )));
                          },
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Image.network(
                                        'https://raw.githubusercontent.com/Asquare-B/software/main/assets/images/timetable.png',
                                        height: 100)),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "View TimeTable",
                                  style: cardStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Extra1()));
                          },
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Container(
                                      child: Image.network(
                                          'https://raw.githubusercontent.com/Asquare-B/software/main/assets/images/extra%20class.png',
                                          height: 100)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Extra Class",
                                  style: cardStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(
                                          user: widget.user,
                                        )));
                          },
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Container(
                                      child: Image.network(
                                          'https://raw.githubusercontent.com/Asquare-B/software/main/assets/images/faculty.png',
                                          height: 100)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Substitute Faculty",
                                  style: cardStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubClass2()));
                          },
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Container(
                                      child: Image.network(
                                          'https://raw.githubusercontent.com/Asquare-B/software/main/assets/images/s%20class.png',
                                          height: 100)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "substitute Class",
                                  style: cardStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RequestHome(
                                        facid: facid, user: widget.user)));
                          },
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Container(
                                      child: Image.network(
                                          'https://raw.githubusercontent.com/Asquare-B/software/main/assets/images/request.png',
                                          height: 100)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Request",
                                  style: cardStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                          facid: facid,
                                          designation: designation,
                                          phone: phone,
                                          photo: photo,
                                          school: school,
                                          email: email,
                                          name: name,
                                        )));
                          },
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Container(
                                      child: Image.network(
                                          'https://raw.githubusercontent.com/Asquare-B/software/main/assets/images/details.jpg',
                                          height: 100)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Profile details",
                                  style: cardStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      crossAxisCount: 2),
                ),
                FlatButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('students')
                          .doc('20MIC0063')
                          .set(({
                            'name': 'ananya ghosh',
                            'email': 'ananya.ghosh2020@gmail.com',
                            'regno': '20MIC0063',
                            'course': [
                              'CSI1003',
                              'MAT2001',
                              'CSI1004',
                              'CSI1002',
                              'STS2021',
                              'CSI3029',
                              'CSI1001',
                              'EEE1005',
                              'HUM1025',
                            ],
                            'slots': [
                              '1111',
                              '1312',
                              '1513',
                              '1211',
                              '1412',
                              '1114',
                              '2325',
                              '2326',
                              '1311',
                              '1512',
                              '1214',
                              '1411',
                              '1113',
                              '2121',
                              '2122',
                              '1511',
                              '1213',
                              '1414',
                              '1112',
                              '1313',
                              '2525',
                              '2526',
                              '1212',
                              '1413',
                              '2425',
                              '2426',
                              '1221',
                              '1124',
                              '1422',
                              '1224',
                              '2323',
                              '2324',
                            ],
                            'CSI1003': ['1111', '1312', '1513'],
                            'MAT2001': [
                              '1211',
                              '1412',
                              '1114',
                              '2325',
                              '2326',
                            ],
                            'CSI1004': ['1311', '1512', '1214'],
                            'CSI1002': ['1411', '1113', '2121', '2122'],
                            'STS2021': ['1511', '1213', '1414'],
                            'CSI3029': ['1112', '1313', '2525', '2526'],
                            'CSI1001': ['1212', '1413', '2425', '2426'],
                            'EEE1005': ['1221', '1124', '1422'],
                            'HUM1025': ['1224', '2323', '2324'],
                          }))
                          .then((value) => print("User Added"))
                          .catchError(
                              (error) => print("Failed to add user: $error"));
                    },
                    child: Text('ADDER')),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
