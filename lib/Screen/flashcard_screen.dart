import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:registerlogin/Screen/home_screen.dart';
import 'package:registerlogin/Screen/view_flashcard_screen.dart';

class Flashcard extends StatefulWidget {
  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    var r = TextStyle(color: Colors.purpleAccent, fontSize: 34);
    return Stack(
      children: <Widget>[
        Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.blue),
                // redirect to boarding page
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()))
                },
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15.0, top: 10.0),
                    child: RichText(
                        text: TextSpan(
                            text: "Flash",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: "Card",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold))
                        ])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'PHI Secure Flashcard List: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Flashcard')
                              .orderBy('Name', descending: false)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              i = 0;
                              return ListView.builder(
                                  itemCount: snapshot.data?.docs.length,
                                  itemBuilder: (context, index) {
                                    print(index);
                                    if (index >= 1) {
                                      print('Greater than 1');
                                      if ((snapshot.data!.docs[index].data()
                                              as dynamic)['Name'] ==
                                          (snapshot.data!.docs[index - 1].data()
                                              as dynamic)['Name']) {
                                        print('Same');
                                      } else {
                                        i++;
                                      }
                                    }

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 5.0),
                                      child: InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              border: Border.all(
                                                  color: i == 0
                                                      ? Colors.yellow
                                                      : i == 1
                                                          ? Colors.grey
                                                          : i == 2
                                                              ? Colors.brown
                                                              : Colors.white,
                                                  width: 3.0,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0,
                                                            left: 15.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            (i + 1).toString() +
                                                                ".",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0,
                                                            left: 15.0),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            top: 5.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              (snapshot.data!
                                                                      .docs[index]
                                                                      .data()
                                                                  as dynamic)['Name'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                              maxLines: 6,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(child: Container()),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 12.0,
                                                        right: 20.0),
                                                    child: ElevatedButton(
                                                      onPressed: () => {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ViewFlashcard(
                                                                name: (snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                        .data()
                                                                    as dynamic)['Name'],
                                                                number: index,
                                                                card1: (snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                        .data()
                                                                    as dynamic)['Card1'],
                                                                card2: (snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                        .data()
                                                                    as dynamic)['Card2'],
                                                                card3: (snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                        .data()
                                                                    as dynamic)['Card3'],
                                                                card4: (snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                        .data()
                                                                    as dynamic)['Card4'],
                                                                card5: (snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                        .data()
                                                                    as dynamic)['Card5'],
                                                              ),
                                                            )),
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors
                                                            .deepPurpleAccent,
                                                      ),
                                                      child: Text(
                                                        "View Flascard",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                  });
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }))
                ],
              ),
            )),
      ],
    );
  }
}
