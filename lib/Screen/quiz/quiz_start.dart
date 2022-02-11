import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registerlogin/Screen/home_screen.dart';
import 'package:registerlogin/models/user_model.dart';

FirebaseFirestore firebase = FirebaseFirestore.instance;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  int count = 0;
  List<String> questions = List.generate(25, (index) => '');
  List<String> answers = List.generate(25, (index) => '');
  final _auth = FirebaseAuth.instance;
  int score = 0;
  int countElement = 0;
  //called when screen loads
  @override
  void initState() {
    firebase.collection("quizname").get().then((querySnapshot) => {
          querySnapshot.docs.forEach((document) {
            setState(() {
              name = document['name'];
            });
          })
        });
    firebase.collection("quiz sets").get().then((querySnapshot) => {
          querySnapshot.docs.forEach((document) {
            setState(() {
              questions[countElement] = document['Q'];
              answers[countElement] = document['A'];
              countElement++;
            });
          })
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${name}', style: TextStyle(fontSize: 29)),
        centerTitle: true,
      ),
      body: Center(
          child: count == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Directions:',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'There will be questions displayed one by one. All questions have one correct answer. The one which you think as correct, please press that option button.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    SizedBox(height: 40),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      color: Colors.blue,
                      height: 80,
                      minWidth: 300,
                      child: Text(
                        'Start Quiz',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: count > countElement
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                'Thank you for taking the quiz. Your final score is ${score}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20)),
                            SizedBox(height: 40),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  minimumSize: Size(200, 50)),
                              onPressed: () {
                                submitScore(score);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              },
                              child: Text(
                                "Submit",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Question ${count}',
                              style: TextStyle(fontSize: 19),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${questions[count - 1]}',
                              style: TextStyle(fontSize: 21),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (answers[count - 1] == 'True') {
                                    score++;
                                  }
                                  count++;
                                });
                              },
                              color: Colors.blue,
                              height: 30,
                              child: Text(
                                'True',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (answers[count - 1] == 'False') {
                                    score++;
                                  }
                                  count++;
                                });
                              },
                              color: Colors.blue,
                              height: 30,
                              child: Text(
                                'False',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Score: ${score}',
                              style: TextStyle(fontSize: 21),
                            ),
                          ],
                        ))),
    );
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
        .update({'point': score});
  }
}
