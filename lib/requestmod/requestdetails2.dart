import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedular/authentication/signin.dart';
import 'package:schedular/mainhome/welcome.dart';

class RequestDetails2 extends StatefulWidget {
  var mode1;
  var user;
  RequestDetails2({required this.user, required this.mode1});

  @override
  _RequestDetailsState2 createState() => _RequestDetailsState2();
}

class _RequestDetailsState2 extends State<RequestDetails2> {
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
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        title: Text('Request Portal'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Welcome(user: widget.user)));
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Sent Request Details',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Name:', style: cardStyle),
                    Text(widget.mode1[2], style: cardStyle1),
                  ],
                ),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.mode1[1]),
                  radius: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: size.width * .57,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Fid:', style: cardStyle),
                                Text(widget.mode1[0], style: cardStyle1),
                              ],
                            ),
                          )),
                      Container(
                          width: size.width * .57,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Course:', style: cardStyle),
                                Text(widget.mode1[3], style: cardStyle1),
                              ],
                            ),
                          )),
                      Container(
                        width: size.width * .57,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Slot:', style: cardStyle),
                              Text(widget.mode1[4], style: cardStyle1),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * .57,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Date:', style: cardStyle),
                              Text(widget.mode1[6], style: cardStyle1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                width: size.width * .75,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Status:', style: cardStyle),
                      (int.parse(widget.mode1[5]) == 0)
                          ? Row(
                              children: [
                                Text('Pending', style: cardStyle1),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                CircleAvatar(
                                  child: Container(
                                    height: 15,
                                  ),
                                  backgroundColor: Colors.yellow,
                                )
                              ],
                            )
                          : (int.parse(widget.mode1[5]) == 1)
                              ? Row(
                                  children: [
                                    Text('Accepted', style: cardStyle1),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    CircleAvatar(
                                      child: Container(
                                        height: 15,
                                      ),
                                      backgroundColor: Colors.green,
                                    )
                                  ],
                                )
                              : Row(
                                  children: [
                                    Text('Declined', style: cardStyle1),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    CircleAvatar(
                                      child: Container(
                                        height: 15,
                                      ),
                                      backgroundColor: Colors.red,
                                    )
                                  ],
                                )
                    ],
                  ),
                )),
            SizedBox(
              height: 70,
            ),
            MaterialButton(
              onPressed: () async {
                FirebaseFirestore.instance
                    .collection('send_request')
                    .doc(widget.mode1[8])
                    .collection(widget.mode1[8] + '-srequest')
                    .doc(widget.mode1[7].toString())
                    .get()
                    .then((element) {
                  setState(() {
                    widget.mode1[5] = element['status'].toString();
                  });
                });
              },
              elevation: 10,
              height: 45,
              minWidth: size.width * 0.35,
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text("Refresh"),
            )
          ],
        ),
      ),
    );
  }
}
