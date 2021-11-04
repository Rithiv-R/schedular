import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class Datepick extends StatefulWidget {
  var finallist;
  var mainfac;
  var course;
  var slot;
  var fac_id;
  var fac_name;
  var fac_photo;
  var slotids;
  Datepick(
      {required this.finallist,
      required this.fac_id,
      required this.fac_name,
      required this.slotids,
      required this.fac_photo,
      required this.mainfac,
      required this.course,
      required this.slot});

  @override
  _DatepickState createState() => _DatepickState();
}

class _DatepickState extends State<Datepick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfDateRangePicker(
        selectionMode: DateRangePickerSelectionMode.single,
        showActionButtons: true,
        selectionColor: Colors.orangeAccent,
        onCancel: () {
          Navigator.pop(context);
        },
        onSubmit: (var value) {
          Object obj = value;
          List<int> first = [7, 1, 2, 3, 4, 5, 6];
          List<int> second = widget.finallist;
          List<int> output = [];
          first.forEach((element) {
            if (!second.contains(element)) {
              output.add(element);
            }
          });
          DateTime date = DateTime.parse(obj.toString());
          if (!second.contains(date.weekday)) {
            FirebaseFirestore.instance
                .collection('send_request')
                .doc(widget.mainfac)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
                var count = documentSnapshot['count'];

                CollectionReference users = FirebaseFirestore.instance
                    .collection('send_request')
                    .doc(widget.mainfac)
                    .collection(widget.mainfac.toString() + '-srequest');
                count = count + 1;
                users
                    .doc(widget.mainfac.toString() +
                        '-' +
                        'sreq' +
                        count.toString())
                    .set(({
                      'doc_name': widget.mainfac.toString() +
                          '-' +
                          'sreq' +
                          count.toString(),
                      'faculty_id': widget.fac_id,
                      'faculty_name': widget.fac_name,
                      'photo': widget.fac_photo,
                      'slot': widget.slot,
                      'course': widget.course,
                      'date': DateTime.parse(obj.toString()),
                      'slotids': widget.slotids,
                      'status': 0,
                    }))
                    .then((value) => print("User Added"))
                    .catchError((error) => print("Failed to add user: $error"));
                FirebaseFirestore.instance
                    .collection('send_request')
                    .doc(widget.mainfac)
                    .update({'count': count});
              }
            });
          } else {
            print('no');
          }
          Navigator.pop(context);
        },
        monthViewSettings: DateRangePickerMonthViewSettings(
          weekendDays: widget.finallist,
        ),
        monthCellStyle: DateRangePickerMonthCellStyle(
            weekendTextStyle: TextStyle(color: Colors.red)),
        selectionShape: DateRangePickerSelectionShape.rectangle,
        view: DateRangePickerView.month,
        minDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        maxDate: DateTime(
            DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
      ),
    );
  }
}
