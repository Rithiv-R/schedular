import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:schedular/requestmod/requestdetail.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class Request extends StatefulWidget {
  var user;
  var rmode;
  Request({required this.user, required this.rmode});

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        title: Text('Request Portal'),
      ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25,
            ),
            child: Text(
              'REQUESTS RECEIVED',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: widget.rmode.length,
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(seconds: 1),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            widget.rmode[index].reqphoto,
                                          ),
                                          radius: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            widget.rmode[index].reqholder,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            widget.rmode[index].reqid +
                                                ' - ' +
                                                widget.rmode[index].reqslot,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            DateFormat.yMMMEd().format(
                                                widget.rmode[index].reqdate),
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.lightBlueAccent,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RequestDetails(
                                                      user: widget.user,
                                                      mode1: [
                                                        DateFormat.yMMMEd()
                                                            .format(widget
                                                                .rmode[index]
                                                                .reqdate),
                                                        widget.rmode[index]
                                                            .reqholder,
                                                        widget
                                                            .rmode[index].reqid,
                                                        widget.rmode[index]
                                                            .reqphoto,
                                                        widget.rmode[index]
                                                            .reqcourse,
                                                        widget.rmode[index]
                                                            .reqdocname,
                                                        widget.rmode[index]
                                                            .reqstatus,
                                                        widget.rmode[index]
                                                            .reqslot
                                                      ],
                                                    )));
                                      },
                                      child: Text(
                                        'Received Request Details',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
