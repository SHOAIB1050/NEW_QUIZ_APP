import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/home.dart';

class ResulPage extends StatefulWidget {
  int marks;
  ResulPage({Key key, @required this.marks}) : super(key: key);
  @override
  _ResulPageState createState() => _ResulPageState(marks);
}

class _ResulPageState extends State<ResulPage> {
  int marks;
  _ResulPageState(this.marks);
  List images = [
    "assets/imags/bad.png",
    "assets/imags/good.png",
    "assets/imags/top.png",
  ];
  String message;
  String image;
  int correct = 0;
  int wrong = 0;
  @override
  void initState() {
    correct = (marks / 5.0).toInt();
    wrong = 10 - correct;
    print("wrong= $wrong");
    print(correct);
    if (marks < 25) {
      image = images[0];
      message = "You Should Try Hard...\n " + " You Scored $marks out of 50";
    } else if (marks >= 25 && marks < 40) {
      image = images[1];
      message = "Good Try...\n " + " You Scored $marks out of 50";
    } else if (marks >= 40) {
      message = "Excellent...\n " + " You Scored $marks out of 50";
      image = images[2];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('YOUR RESULT'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: InkWell(
                child: Material(
                  elevation: 20.0,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    height: 250,
                    width: 300,
                    child: ClipOval(
                      child: Image.asset(image),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: 300,
              child: Center(
                child: Text(
                    "CORRECT QUESTIONS : $correct \n WRONG QUESTIONS : $wrong",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Quando',
                        //fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: 300,
              child: Center(
                child: Text(message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Quando',
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              });
            },
            child: Container(
              child: Center(
                child: (Text(
                  'TRY AGAIN',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Quando'),
                )),
              ),
              margin: EdgeInsets.all(30.0),
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadiusDirectional.circular(20.0)),
            ),
          )
        ],
      ),
    );
  }
}
