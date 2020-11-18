import 'dart:convert';
import 'package:flutter/material.dart';
import 'QuizPage.dart';

class GetdataJosan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString("assets/datascience.json"),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text('Loading'),
            ),
          );
        } else {
          return QizePage(mydata: mydata);
        }
      },
    );
  }
}
