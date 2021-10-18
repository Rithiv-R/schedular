import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  var facid = '';
  var email = '';
  var phone = '';
  var name = '';
  var school = '';
  var designation = '';
  var photo = '';
  Profile(
      {required this.designation,
      required this.email,
      required this.facid,
      required this.name,
      required this.phone,
      required this.photo,
      required this.school});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w800);
    var cardStyle1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        title: Text(
          'PROFILE',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: 500,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  widget.photo,
                  height: 200,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    width: 500,
                    child: Card(
                        color: Color.fromRGBO(255, 165, 0, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Name:', style: cardStyle),
                              Padding(padding: EdgeInsets.only(left: 20)),
                              Text('Dr:' + widget.name, style: cardStyle1),
                            ],
                          ),
                        )),
                  ),
                  Container(
                    width: 500,
                    child: Card(
                        color: Color.fromRGBO(255, 165, 0, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Text('Fa.No.:', style: cardStyle),
                              Padding(padding: EdgeInsets.only(left: 20)),
                              Text(widget.facid, style: cardStyle1),
                            ],
                          ),
                        )),
                  ),
                  Container(
                    width: 500,
                    child: Card(
                        color: Color.fromRGBO(255, 165, 0, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('School:', style: cardStyle),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text(widget.school, style: cardStyle1),
                            ],
                          ),
                        )),
                  ),
                  Container(
                    width: 500,
                    child: Card(
                        color: Color.fromRGBO(255, 165, 0, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email:", style: cardStyle),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text(widget.email, style: cardStyle1),
                            ],
                          ),
                        )),
                  ),
                  Container(
                    width: 500,
                    child: Card(
                        color: Color.fromRGBO(255, 165, 0, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Phone:', style: cardStyle),
                              Padding(padding: EdgeInsets.only(left: 20)),
                              Text('9865230033', style: cardStyle1),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
