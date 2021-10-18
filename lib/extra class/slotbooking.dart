import 'package:flutter/material.dart';

class SlotBooking extends StatefulWidget {
  const SlotBooking({Key? key}) : super(key: key);

  @override
  _SlotBookingState createState() => _SlotBookingState();
}

class _SlotBookingState extends State<SlotBooking> {
  @override
  Widget build(BuildContext context) {
    var cardStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w800);
    var cardStyle1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
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
        title: Text('Class Booking Details'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                ' Class Details\nfor Extra Class',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Card(
                      color: Color.fromRGBO(255, 165, 0, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Faculty:', style: cardStyle),
                            Text('Fid', style: cardStyle1),
                            Text('Faculty Name', style: cardStyle1),
                          ],
                        ),
                      )),
                  Card(
                      color: Color.fromRGBO(255, 165, 0, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Course:', style: cardStyle),
                            Text('Code', style: cardStyle1),
                            Text('Course Name', style: cardStyle1),
                          ],
                        ),
                      )),
                  Card(
                      color: Color.fromRGBO(255, 165, 0, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Student's Slot:", style: cardStyle),
                            Text('slot', style: cardStyle1),
                          ],
                        ),
                      )),
                  Card(
                      color: Color.fromRGBO(255, 165, 0, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Booked Slot:', style: cardStyle),
                            Text('Slot', style: cardStyle1),
                          ],
                        ),
                      )),
                  Card(
                      color: Color.fromRGBO(255, 165, 0, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Date:', style: cardStyle),
                            Text('date', style: cardStyle1),
                          ],
                        ),
                      )),
                  Card(
                      color: Color.fromRGBO(255, 165, 0, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Class timing:', style: cardStyle),
                            Text('time', style: cardStyle1),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                'Class is Booked',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.green),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.orangeAccent,
              splashColor: Colors.deepOrange,
              child: Text(
                'Message students',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
