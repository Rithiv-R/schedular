import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schedular/authentication/signin.dart';
import 'package:schedular/authentication/signup.dart';
import 'package:transition/transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      home: MyMainPage(),
    );
  }
}

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Scheduler',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Color(0xffe89821),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Faculty and Extra Class Scheduler',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Container(
                height: size.height / 3,
                child: Image.network(
                    'https://image.freepik.com/free-vector/computer-monitor-graphic-animator-creating-video-game-modeling-motion-processing-video-file-using-professional-editor-vector-illustration-graphic-design-art-designer-workplace-concept_74855-13038.jpg'),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    color: Colors.orangeAccent,
                    splashColor: Colors.deepOrange,
                    onPressed: () {
                      Navigator.push(
                          context,
                          Transition(
                              child: SignIn(),
                              transitionEffect:
                                  TransitionEffect.RIGHT_TO_LEFT));
                    },
                    height: 60,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          Transition(
                              child: SignUp(),
                              transitionEffect:
                                  TransitionEffect.RIGHT_TO_LEFT));
                    },
                    color: Colors.orangeAccent,
                    splashColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
