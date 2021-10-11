import 'package:flutter/material.dart';
import 'package:schedular/models.dart';

class Same_Fac_lab extends StatefulWidget {
  List<Lab_same> list;
  Same_Fac_lab({
    required this.list,
  });
  @override
  _Same_Fac_labState createState() => _Same_Fac_labState();
}

// ignore: camel_case_types
class _Same_Fac_labState extends State<Same_Fac_lab> {
  List<Lab_same> final_list = [];
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
                    Padding(padding: EdgeInsets.only(top: 10)),
                    ListTile(
                      leading: Image.network(final_list[index].photo),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.send_outlined)),
                      title: Text(final_list[index].facid),
                      subtitle: Text(final_list[index].name),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                )),
      ),
    );
  }
}
