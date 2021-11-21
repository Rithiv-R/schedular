import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedular/authentication/signin.dart';
import 'package:email_auth/email_auth.dart';
import 'package:schedular/mainhome/welcome.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

/*class _SignUpState extends State<SignUp> {
  String email = "";
  String password = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            email = value.trim();
                          });
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: () {
                        Checker();
                      },
                      color: Colors.orangeAccent,
                      splashColor: Colors.deepOrange,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?"),
                      MaterialButton(
                        splashColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignIn()));
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void Checker() async {
    var counter = 0;
    await FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (element['mail_id'] == email) {
          counter = 1;
          password = element['password'];
        }
      });
    });
    if (counter == 1) {
      auth.createUserWithEmailAndPassword(email: email, password: password);
      auth.sendPasswordResetEmail(email: email);
      Navigator.of(context).pop();
    }
  }
}*/

class _SignUpState extends State<SignUp> {
  String email = "";
  String password = "";
  String otp = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  List array = [
    'https://image.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg',
    'https://image.freepik.com/free-vector/sign-concept-illustration_114360-125.jpg',
  ];
  int counter1 = 0;
  int counter = 0;
  String error = "";
  bool result = false;
  late EmailAuth emailAuth;
  void sendOTP() async {
    result = await emailAuth.sendOtp(recipientMail: email, otpLength: 4);
    if (result) {
      dis(context, 'OTP sent to mail sent Successful');
    } else {
      dis(context, 'OTP can\'t be sent to $email sent');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        if (counter1 < 100) {
          counter1 += 1;
        } else {
          counter1 = 0;
        }
      });
    });
    emailAuth = new EmailAuth(sessionName: "Schedular SignUp Session");
  }

  Widget Mywidget() {
    return (counter1 % 2 == 0)
        ? Image.network(array[1], fit: BoxFit.fill)
        : Image.network(array[0], fit: BoxFit.fill);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                height: 300,
                width: 290,
                child: Mywidget(),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value.trim();
                    });
                  },
                ),
              ),
              (counter == 1)
                  ? Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: TextField(
                              obscureText: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'password',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  password = value.trim();
                                });
                              },
                            )),
                      ],
                    )
                  : Container(),
              (counter == 2)
                  ? Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: TextField(
                              obscureText: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'OTP',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  otp = value.trim();
                                });
                              },
                            )),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 60,
              ),
              (counter == 0)
                  ? MaterialButton(
                      height: 60,
                      minWidth: 200,
                      child: Text(
                        "SEND OTP",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.orangeAccent,
                      splashColor: Colors.deepOrange,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('faculties')
                            .get()
                            .then((QuerySnapshot querySnapshot) {
                          querySnapshot.docs.forEach((element) async {
                            if (element['mail_id'] == email) {
                              setState(() {
                                sendOTP();
                                counter = 2;
                              });
                            }
                          });
                        });
                        if (counter != 2) {
                          dis(context,
                              'Contact Adminstrator since your email is not allocated in Schedular');
                        }
                      })
                  : (counter == 1)
                      ? MaterialButton(
                          height: 60,
                          minWidth: 200,
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.orangeAccent,
                          splashColor: Colors.deepOrange,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection('faculties')
                                .get()
                                .then((QuerySnapshot querySnapshot) {
                              querySnapshot.docs.forEach((element) async {
                                if (element['mail_id'] == email) {
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password)
                                        .then((_) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Welcome(user: email)));
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      error =
                                          'The password provided is too weak.';
                                      dis1(context, error);
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      error =
                                          'The account already exists for this $email.';
                                      Errodis(context, error);
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                }
                              });
                            });
                          })
                      : MaterialButton(
                          height: 60,
                          minWidth: 200,
                          child: Text(
                            "VERIFY",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.orangeAccent,
                          splashColor: Colors.deepOrange,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onPressed: () async {
                            var res = emailAuth.validateOtp(
                                recipientMail: email, userOtp: otp);
                            if (res) {
                              setState(() {
                                counter = 1;
                              });
                            } else {
                              counter = 0;
                              dis(context, 'Wrong OTP Entered');
                            }
                          }),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  MaterialButton(
                    splashColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void Errodis(
    BuildContext context,
    String error,
  ) {
    var alertDialog = AlertDialog(
        title: Text(
          'ERROR!',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(error),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                counter = 0;
              });
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ]);
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void dis(
    BuildContext context,
    String error,
  ) {
    var alertDialog = AlertDialog(
        title: Text(
          'MAIL VERIFICATION!',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(error),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ]);
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void dis1(
    BuildContext context,
    String error,
  ) {
    var alertDialog = AlertDialog(
        title: Text(
          'ERROR!',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(error),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ]);
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
