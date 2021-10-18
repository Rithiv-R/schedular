import 'package:flutter/material.dart';
import 'package:schedular/models.dart';
import 'package:share/share.dart';

class Diff_Fac_lab extends StatefulWidget {
  List<Lab_diff> list;
  var counter;
  var slot;
  var course;
  Diff_Fac_lab({
    required this.list,
    required this.counter,
    required this.slot,
    required this.course,
  });
  @override
  _Diff_Fac_labState createState() => _Diff_Fac_labState();
}

// ignore: camel_case_types
class _Diff_Fac_labState extends State<Diff_Fac_lab> {
  List<Lab_diff> final_list = [];
  var facid = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final_list = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('LAB FREE FACULTIES'),
      ),
      body: (final_list.length == 0)
          ? Container(
              child: Center(
                child: Text('NO FACULTIES ARE FREE'),
              ),
            )
          : (widget.counter == '1')
              ? Container(
                  child: ListView.builder(
                      itemCount: final_list.length,
                      itemBuilder: (context, index) => Column(
                            children: <Widget>[
                              Card(
                                child: Container(
                                  height: 100,
                                  child: Ink(
                                    color: (facid == final_list[index].facid)
                                        ? Colors.orangeAccent[200]
                                        : Colors.white,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              this.facid =
                                                  final_list[index].facid;
                                            });
                                          },
                                          child: ListTile(
                                            horizontalTitleGap: 25,
                                            leading: Container(
                                              child: Image.network(
                                                final_list[index].photo,
                                                fit: BoxFit.cover,
                                                height: 90,
                                                width: 70,
                                              ),
                                            ),
                                            trailing: IconButton(
                                                onPressed: () {
                                                  Share.share(
                                                      'You are assigned for substitution for faculty:${final_list[index].facid} - ${final_list[index].name} for the slot -${widget.slot} of course ${widget.course} ');
                                                },
                                                icon: Icon(
                                                  Icons.send_outlined,
                                                  color: Colors.green,
                                                )),
                                            title: Text(
                                              final_list[index].facid,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            subtitle: Text(
                                              final_list[index].name,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                )
              : Container(
                  child: ListView.builder(
                      itemCount: final_list.length,
                      itemBuilder: (context, index) => Column(
                            children: <Widget>[
                              Card(
                                child: Ink(
                                  color: (facid == final_list[index].facid)
                                      ? Colors.orangeAccent
                                      : Colors.white,
                                  child: Container(
                                    height: 100,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              this.facid =
                                                  final_list[index].facid;
                                            });
                                          },
                                          child: ListTile(
                                            horizontalTitleGap: 25,
                                            leading: Container(
                                              child: Image.network(
                                                final_list[index].photo,
                                                fit: BoxFit.cover,
                                                height: 90,
                                                width: 70,
                                              ),
                                            ),
                                            title: Text(
                                              final_list[index].facid,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            subtitle: Text(
                                              final_list[index].name,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                ),
    );
  }
}
