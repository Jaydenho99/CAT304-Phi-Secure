import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_card/flash_card.dart';
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
    List<String> card = [
      widget.card1,
      widget.card2,
      widget.card3,
      widget.card4,
      widget.card5
    ];

    final List<FlashCard> flashCard = List.generate(
        card.length,
        (index) => FlashCard(
              frontWidget: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        card[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  )),
              backWidget: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                    Image.asset(
                      "assets/logo.png",
                      width: 200,
                      height: 100,
                    ),
                  ],
                ),
              ),
              width: 300,
              height: 400,
            ));

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
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(55.0),
        itemCount: flashCard.length,
        itemBuilder: (context, index) {
          return flashCard[index];
        },
      ),
    );
  }
}
