import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'quizspace.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget customcard() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(40.0),
          child: InkWell(
            child: Material(
              elevation: 20.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 350,
                width: 300,
                child: ClipOval(
                  child: Image.asset('assets/imags/1.png'),
                ),
              ),
            ),
          ),
        ),
        Text('CHECK YOUR DATA SCIENCE SKILL',
            style: TextStyle(
                fontFamily: 'Quando',
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 15)),
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => GetdataJosan()));
            });
          },
          child: Container(
            child: Center(
              child: (Text(
                'START',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Satisfy'),
              )),
            ),
            margin: EdgeInsets.all(30.0),
            height: 60,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadiusDirectional.circular(20.0)),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Text(
              'Welcome to Quiz',
              style: TextStyle(fontFamily: 'Alike'),
            ),
          ),
          body: Container(
            child: customcard(),
          )),
    );
  }
}
