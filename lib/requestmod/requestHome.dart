import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schedular/requestmod/mainrequest.dart';
import 'package:schedular/requestmod/requestSent.dart';
import 'package:schedular/requestmod/sreqmodel.dart';

class RequestHome extends StatefulWidget {
  var facid;
  var user;
  RequestHome({
    required this.facid,
    required this.user,
  });
  @override
  _RequestHomeState createState() => _RequestHomeState();
}

class _RequestHomeState extends State<RequestHome> {
  List<sreqmodel> smode = [];
  List<rreqmodel> rmode = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('send_request')
        .doc(widget.facid)
        .collection(widget.facid.toString() + '-srequest')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (element['trial-id'] == 0) {
          sreqmodel sw = sreqmodel(
            reqcourse: element['course'].toString(),
            reqstatus: element['status'].toString(),
            reqdate: element['date'].toDate(),
            reqholder: element['faculty_name'],
            reqid: element['faculty_id'],
            reqphoto: element['photo'],
            reqslot: element['slot'],
            reqdocname: element['doc_name'],
            reqsender: element['sender-id'],
          );

          smode.add(sw);
        }
      });
    });
    FirebaseFirestore.instance
        .collection('receive_request')
        .doc(widget.facid)
        .collection(widget.facid.toString() + '-rrequest')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (element['trial-id'] == 0) {
          var sdoc = element['sdoc_name'];
          var sid = element['requester'];
          FirebaseFirestore.instance
              .collection('send_request')
              .doc(sid)
              .collection(sid.toString() + '-srequest')
              .doc(sdoc)
              .get()
              .then((DocumentSnapshot element1) {
            if (element1.exists) {
              FirebaseFirestore.instance
                  .collection('faculties')
                  .doc(element1['sender-id'])
                  .get()
                  .then((value) {
                var name = value['faculty_name'];
                var photo = value['faculty_pic'];
                rreqmodel rw = rreqmodel(
                    reqdate: element1['date'].toDate(),
                    reqholder: name,
                    reqid: element1['sender-id'],
                    reqphoto: photo,
                    reqcourse: element1['course'],
                    reqdocname: sdoc,
                    reqstatus: element1['status'].toString(),
                    reqslot: element1['slot']);
                rmode.add(rw);
              });
            }
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
        title: Text('REQUEST PHASE'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.network(
                          'https://raw.githubusercontent.com/Asquare-B/software/main/assets/images/requestHome.jpg'),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Request(
                              user: widget.user,
                              rmode: List.from(rmode.reversed),
                            )));
                  },
                  splashColor: Colors.deepOrange,
                  color: Colors.orangeAccent,
                  child: Text(
                    'Received Request',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RequestSent(
                            user: widget.user,
                            smode: List.from(smode.reversed))));
                  },
                  splashColor: Colors.deepOrange,
                  color: Colors.orangeAccent,
                  child: Text(
                    'Sent Request Status',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {},
              splashColor: Colors.deepOrange,
              color: Colors.orangeAccent,
              child: Text(
                'New Request',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
