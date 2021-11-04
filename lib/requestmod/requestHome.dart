import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedular/requestmod/mainrequest.dart';
import 'package:schedular/requestmod/requestSent.dart';
import 'package:schedular/requestmod/sreqmodel.dart';

class RequestHome extends StatefulWidget {
  var facid;
  RequestHome({
    required this.facid,
  });
  @override
  _RequestHomeState createState() => _RequestHomeState();
}

class _RequestHomeState extends State<RequestHome> {
  List<sreqmodel> smode = [];
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
              reqdate: element['date'].toDate(),
              reqholder: element['faculty_name'],
              reqid: element['faculty_id'],
              reqphoto: element['photo'],
              reqslot: element['slot']);
          smode.add(sw);
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Request()));
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
                        builder: (context) => RequestSent(smode: smode)));
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
