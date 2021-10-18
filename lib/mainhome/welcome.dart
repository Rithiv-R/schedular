import 'package:flutter/material.dart';
import 'package:schedular/Timeview/Homestart.dart';
import 'package:schedular/home.dart';
import 'package:schedular/profile/facultyprofile.dart';

class Welcome extends StatefulWidget {
  var user;
  Welcome({this.user});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: Colors.white,
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
                          onTap: () {},
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
                          onTap: () {},
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
                          onTap: () {},
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
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
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
