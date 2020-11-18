import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quiz_flutter_app/Result.dart';

class QizePage extends StatefulWidget {
  var mydata;
  QizePage({Key key, this.mydata}) : super(key: key);
  @override
  _QizePageState createState() => _QizePageState(mydata);
}

class _QizePageState extends State<QizePage> {
  var mydata;
  _QizePageState(this.mydata);
  int marks = 0;
  Color colorshow = Colors.purple;
  Color Right = Colors.green;
  Color Wrong = Colors.red;
  int timer = 30;
  String Showtime = "30";
  bool cancel_time = false;
  var list = new List<int>.generate(11, (int index) => index); // [0, 1, 4];
  int count = 0;
  int qn = 1;
  int question_number = 0;

  Map<String, Color> buttoncolor = {
    "a": Colors.purple,
    "b": Colors.purple,
    "c": Colors.purple,
    "d": Colors.purple,
  };

  @override
  void initState() {
    list.remove(0);
    list.shuffle();
    print(list);
    question_number = list[count];
    startTime();
    super.initState();
  }

  void startTime() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          predect_correct_answer();
          Call_Timer_for_NextQuestion();
        } else if (cancel_time == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        Showtime = timer.toString();
      });
    });
  }

  void nexrquestion() {
    cancel_time = false;
    timer = 30;
    setState(() {
      /*if (question_number < 10) {
        question_number++;
        print(question_number);
      } */
      if (count < 9) {
        count++;
        qn = count + 1;
        question_number = list[count];
      } else {
        //show result
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ResulPage(marks: marks)));
      }
      buttoncolor["a"] = Colors.purple;
      buttoncolor["b"] = Colors.purple;
      buttoncolor["c"] = Colors.purple;
      buttoncolor["d"] = Colors.purple;
    });
    startTime();
  }

  void predect_correct_answer() {
    if (mydata[2][question_number.toString()] ==
        mydata[1][question_number.toString()]["a"]) {
      buttoncolor["a"] = Right;
    } else if (mydata[2][question_number.toString()] ==
        mydata[1][question_number.toString()]["b"]) {
      buttoncolor["b"] = Right;
    } else if (mydata[2][question_number.toString()] ==
        mydata[1][question_number.toString()]["c"]) {
      buttoncolor["c"] = Right;
    } else if (mydata[2][question_number.toString()] ==
        mydata[1][question_number.toString()]["d"]) {
      buttoncolor["d"] = Right;
    }
  }

  void Call_Timer_for_NextQuestion() {
    Timer(Duration(seconds: 2), nexrquestion);
  }

  void checkanswer(String point) {
    if (mydata[2][question_number.toString()] ==
        mydata[1][question_number.toString()][point]) {
      marks = marks + 5;
      colorshow = Right;
    } else {
      colorshow = Wrong;
      predect_correct_answer();
    }
    setState(() {
      buttoncolor[point] = colorshow;

      cancel_time = true;
    });
    Call_Timer_for_NextQuestion();
  }

  Widget choiceButton(String point) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(point),
        child: Text(
          mydata[1][question_number.toString()][point],
          style:
              TextStyle(color: Colors.white, fontFamily: 'Alike', fontSize: 16),
          maxLines: 1,
        ),
        color: buttoncolor[point],
        highlightColor: Colors.indigoAccent[700],
        minWidth: 250.0,
        height: 50.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('IQ HUB'),
            content: Text("You can't Go Back At This Stage."),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: (Text('OK')),
              )
            ],
          ),
        );
      },
      child: Scaffold(
        body: Column(
          children: [
            //FOR SCORE
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.purple,
                width: 370,
                child: Center(
                  child: Text(
                    "SCORE = $marks",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            //for time
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  Showtime,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Time New Roman"),
                ),
              ),
            ),
            //for Question number
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "QUESTION : $qn",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Time New Roman"),
                ),
              ),
            ),
            //FOR QUESTION
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(25),
                child: Center(
                  child: Text(
                    mydata[0][question_number.toString()],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontFamily: "Quando"),
                  ),
                ),
              ),
            ),
            //FOR BUTTONS
            Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    choiceButton("a"),
                    choiceButton("b"),
                    choiceButton("c"),
                    choiceButton("d")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
