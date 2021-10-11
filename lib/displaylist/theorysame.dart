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
