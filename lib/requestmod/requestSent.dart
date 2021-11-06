import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedular/requestmod/requestdetails2.dart';
import 'package:schedular/requestmod/sreqmodel.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RequestSent extends StatefulWidget {
  var smode;
  var user;

  RequestSent({this.user, this.smode});

  @override
  _RequestSentState createState() => _RequestSentState();
}

class _RequestSentState extends State<RequestSent> {
  @override
  Widget build(BuildContext context) {
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
              'REQUESTS SENT',
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
                itemCount: widget.smode.length,
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(seconds: 1),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: Column(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          widget.smode[index].reqphoto,
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
                                          widget.smode[index].reqholder,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          widget.smode[index].reqid +
                                              ' - ' +
                                              widget.smode[index].reqslot,
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
                                              widget.smode[index].reqdate),
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
                                      print([
                                        widget.smode[index].reqid,
                                        widget.smode[index].reqphoto,
                                        widget.smode[index].reqholder,
                                        widget.smode[index].reqcourse,
                                        widget.smode[index].reqslot,
                                        widget.smode[index].reqstatus,
                                        DateFormat.yMMMEd().format(
                                            widget.smode[index].reqdate),
                                        widget.smode[index].reqdocname,
                                        widget.smode[index].reqsender,
                                      ]);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RequestDetails2(
                                                    user: widget.user,
                                                    mode1: [
                                                      widget.smode[index].reqid,
                                                      widget.smode[index]
                                                          .reqphoto,
                                                      widget.smode[index]
                                                          .reqholder,
                                                      widget.smode[index]
                                                          .reqcourse,
                                                      widget
                                                          .smode[index].reqslot,
                                                      widget.smode[index]
                                                          .reqstatus,
                                                      DateFormat.yMMMEd()
                                                          .format(
                                                        widget.smode[index]
                                                            .reqdate,
                                                      ),
                                                      widget.smode[index]
                                                          .reqdocname,
                                                      widget.smode[index]
                                                          .reqsender
                                                    ],
                                                  )));
                                    },
                                    child: Text(
                                      'Sent Request Details',
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
          )
        ],
      )),
    );
  }
}
