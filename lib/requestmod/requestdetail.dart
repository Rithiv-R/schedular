import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedular/mainhome/welcome.dart';

class RequestDetails extends StatefulWidget {
  var mode1;
  var user;
  RequestDetails({required this.user, this.mode1});

  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
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
            Text(
              'Received\nRequest Details',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
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
                    Text(widget.mode1[1], style: cardStyle1),
                  ],
                ),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.mode1[3]),
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
                                Text(widget.mode1[2], style: cardStyle1),
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
                                Text(widget.mode1[4], style: cardStyle1),
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
                              Text(widget.mode1[7], style: cardStyle1),
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
                              Text(widget.mode1[0], style: cardStyle1),
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
                      Text('Request Status:', style: cardStyle),
                      (int.parse(widget.mode1[6]) == 0)
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
                          : (int.parse(widget.mode1[6]) == 1)
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    onPressed: () async {
                      Decline(context);
                    },
                    elevation: 10,
                    height: 45,
                    minWidth: size.width * 0.35,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("Decline"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    onPressed: () async {
                      Accept(context);
                    },
                    elevation: 10,
                    height: 45,
                    minWidth: size.width * 0.35,
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("Accept"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void Decline(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text(
          'Decline Message Confirmation!',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(
            'Are you sure to decline the request message of Faculty ${widget.mode1[1]}?'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Container(
              height: 20,
              width: 25,
              child: Text(
                'NO',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('send_request')
                  .doc(widget.mode1[2])
                  .collection(widget.mode1[2].toString() + '-srequest')
                  .doc(widget.mode1[5])
                  .update({'status': -1}).then((value) {
                setState(() {
                  widget.mode1[6] = '-1';
                });
              });
              Navigator.pop(context);
            },
            child: Text(
              'YES',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ]);
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void Accept(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text(
          'Accept Message Confirmation!',
          style: TextStyle(
              color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(
            'Are you sure to accept the request message of Faculty ${widget.mode1[1]}?'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Container(
              height: 20,
              width: 25,
              child: Text(
                'NO',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('send_request')
                  .doc(widget.mode1[2])
                  .collection(widget.mode1[2].toString() + '-srequest')
                  .doc(widget.mode1[5])
                  .update({'status': 1}).then((value) {
                setState(() {
                  widget.mode1[6] = '1';
                });
              });
              Navigator.pop(context);
            },
            child: Text(
              'YES',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          )
        ]);
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
