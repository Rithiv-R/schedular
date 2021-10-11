import 'package:flutter/material.dart';
import 'package:schedular/models.dart';

class Same_Fac_Theory extends StatefulWidget {
  List<Theory_same> list;
  Same_Fac_Theory({
    required this.list,
  });
  @override
  _Same_Fac_TheoryState createState() => _Same_Fac_TheoryState();
}

// ignore: camel_case_types
class _Same_Fac_TheoryState extends State<Same_Fac_Theory> {
  List<Theory_same> final_list = [];
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
        title: Text('FREE FACULTY LIST'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: final_list.length,
            itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    Card(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          border: Border.all(
                            width: 3,
                            color: Colors.teal,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 10)),
                            ListTile(
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
                                  onPressed: () {},
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
                            Padding(padding: EdgeInsets.only(top: 10)),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}
