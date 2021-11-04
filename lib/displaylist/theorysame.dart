import 'package:flutter/material.dart';
import 'package:schedular/displaylist/datepicker.dart';
import 'package:schedular/substitute%20faculty.dart/models.dart';
import 'package:share/share.dart';

class Same_Fac_Theory extends StatefulWidget {
  List<Theory_same> list;
  var counter;
  var slot;
  var course;
  var id;
  var mainfac;
  Same_Fac_Theory({
    required this.id,
    required this.mainfac,
    required this.list,
    required this.counter,
    required this.slot,
    required this.course,
  });
  @override
  _Same_Fac_TheoryState createState() => _Same_Fac_TheoryState();
}

// ignore: camel_case_types
class _Same_Fac_TheoryState extends State<Same_Fac_Theory> {
  List<Theory_same> final_list = [];
  var days;
  var facid = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<int> first = [7, 1, 2, 3, 4, 5, 6];
    List<int> second = [int.parse(widget.id.toString().substring(1, 2))];
    List<int> output = [];
    first.forEach((element) {
      if (!second.contains(element)) {
        output.add(element);
      }
    });
    days = output;
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
          title: Text('THEORY FREE FACULTIES'),
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
                                    child: (final_list.length == 0)
                                        ? Container(
                                            child: Center(
                                              child: Text(
                                                'Same Course Faculty is not available at this slot',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Card(
                                            child: Container(
                                              height: 100,
                                              child: Ink(
                                                color: (facid ==
                                                        final_list[index].facid)
                                                    ? Colors.orangeAccent[200]
                                                    : Colors.white,
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10)),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          this.facid =
                                                              final_list[index]
                                                                  .facid;
                                                        });
                                                      },
                                                      child: ListTile(
                                                        horizontalTitleGap: 25,
                                                        leading: Container(
                                                          child: Image.network(
                                                            final_list[index]
                                                                .photo,
                                                            fit: BoxFit.cover,
                                                            height: 90,
                                                            width: 70,
                                                          ),
                                                        ),
                                                        trailing: IconButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          Datepick(
                                                                            slotids: [
                                                                              widget.id,
                                                                            ],
                                                                            finallist:
                                                                                this.days,
                                                                            mainfac:
                                                                                widget.mainfac,
                                                                            slot:
                                                                                widget.slot,
                                                                            course:
                                                                                widget.course,
                                                                            fac_name:
                                                                                final_list[index].name,
                                                                            fac_id:
                                                                                final_list[index].facid,
                                                                            fac_photo:
                                                                                final_list[index].photo,
                                                                          )));
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .send_outlined,
                                                              color:
                                                                  Colors.green,
                                                            )),
                                                        title: Text(
                                                          final_list[index]
                                                              .facid,
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black87,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          final_list[index]
                                                              .name,
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10)),
                                                  ],
                                                ),
                                              ),
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
                                  child: Container(
                                    child: (final_list.length == 0)
                                        ? Container(
                                            child: Center(
                                              child: Text(
                                                'Same Course Faculty is not available at this slot',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Card(
                                            child: Container(
                                              height: 100,
                                              child: Ink(
                                                color: (facid ==
                                                        final_list[index].facid)
                                                    ? Colors.orangeAccent[200]
                                                    : Colors.white,
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10)),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          this.facid =
                                                              final_list[index]
                                                                  .facid;
                                                        });
                                                      },
                                                      child: ListTile(
                                                        horizontalTitleGap: 25,
                                                        leading: Container(
                                                          child: Image.network(
                                                            final_list[index]
                                                                .photo,
                                                            fit: BoxFit.cover,
                                                            height: 90,
                                                            width: 70,
                                                          ),
                                                        ),
                                                        title: Text(
                                                          final_list[index]
                                                              .facid,
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black87,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          final_list[index]
                                                              .name,
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            )),
                  ));
  }
}
