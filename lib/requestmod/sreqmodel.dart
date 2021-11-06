class sreqmodel {
  var reqholder;
  var reqphoto;
  var reqid;
  var reqslot;
  var reqdate;
  var reqstatus;
  var reqcourse;
  var reqdocname;
  var reqsender;
  sreqmodel(
      {required this.reqdate,
      required this.reqholder,
      required this.reqid,
      required this.reqphoto,
      required this.reqstatus,
      required this.reqcourse,
      required this.reqslot,
      required this.reqdocname,
      required this.reqsender});
}

class rreqmodel {
  var reqholder;
  var reqphoto;
  var reqid;
  var reqslot;
  var reqdate;
  var reqstatus;
  var reqcourse;
  var reqdocname;
  rreqmodel({
    required this.reqdate,
    required this.reqholder,
    required this.reqid,
    required this.reqphoto,
    required this.reqslot,
    required this.reqcourse,
    required this.reqdocname,
    required this.reqstatus,
  });
}
