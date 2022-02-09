import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registerlogin/Screen/flashcard_screen.dart';

class ViewFlashcard extends StatefulWidget {
  final String name;
  final String card1;
  final String card2;
  final String card3;
  final String card4;
  final String card5;

  const ViewFlashcard({
    Key? key,
    required this.name,
    required this.card1,
    required this.card2,
    required this.card3,
    required this.card4,
    required this.card5,
  }) : super(key: key);

  @override
  _ViewFlashcardState createState() => _ViewFlashcardState();
}

class _ViewFlashcardState extends State<ViewFlashcard> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('Flashcard').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Flashcard()));
          },
        ),
        actions: [],
        title: Text(
          "${widget.name}",
          style: TextStyle(fontSize: 29),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Card(
          color: Colors.blue,
          margin: const EdgeInsets.all(100),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Text("${widget.card1}",
              style: TextStyle(
                color: Colors.white,
                height: 2,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center)),
    );
  }
}
