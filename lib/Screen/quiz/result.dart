import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:registerlogin/Screen/home_screen.dart';
import 'package:registerlogin/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  final _auth = FirebaseAuth.instance;
  Result(this.resultScore, this.resetHandler);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 41) {
      resultText = 'You are awesome!';
      print(resultScore);
    } else if (resultScore >= 31) {
      resultText = 'Pretty likeable!';
      print(resultScore);
    } else if (resultScore >= 21) {
      resultText = 'You need to work more!';
    } else if (resultScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$resultScore',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ), //Text
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
            child: MaterialButton(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  submitScore(resultScore);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  "Submit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
          ) //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }

  void submitScore(int score) async {
    // calling firestore
    // calling our user model
    // sending the values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    //writing all the values

    await firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .update({'point': resultScore});
  }
}
