import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:registerlogin/Screen/home_screen.dart';
import 'package:registerlogin/Screen/view_user_screen.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    var r = TextStyle(color: Colors.purpleAccent, fontSize: 34);
    return Stack(
      children: <Widget>[
        Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                // redirect to boarding page
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()))
                },
              ),
              title: Text(
                "Leaderboard",
                style: TextStyle(fontSize: 29),
              ),
              centerTitle: true,
            ),
            body: Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15.0, top: 10.0),
                    child: RichText(
                        text: TextSpan(
                            text: "Leader",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: "Board",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold))
                        ])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'PHI Secure Rank Board: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .orderBy('point', descending: true)
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
                                              as dynamic)['point'] ==
                                          (snapshot.data!.docs[index - 1].data()
                                              as dynamic)['point']) {
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
                                                  color: index == 0
                                                      ? Colors.yellowAccent
                                                      : index == 1
                                                          ? Colors.grey.shade300
                                                          : index == 2
                                                              ? Colors.brown
                                                              : Colors.white38,
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
                                                            (index + 1)
                                                                    .toString() +
                                                                ".",
                                                            style: TextStyle(
                                                                color: index ==
                                                                        0
                                                                    ? Colors
                                                                        .yellowAccent
                                                                    : index == 1
                                                                        ? Colors.grey[
                                                                            300]
                                                                        : index ==
                                                                                2
                                                                            ? Colors.brown
                                                                            : Colors.white),
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
                                                    child: Row(
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    image: DecorationImage(
                                                                        image: NetworkImage((snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                            .data() as dynamic)['photo']),
                                                                        fit: BoxFit.fill)))),
                                                      ],
                                                    ),
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
                                                                      as dynamic)[
                                                                  'username'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                              maxLines: 6,
                                                            )),
                                                        Text(
                                                          "Points: " +
                                                              (snapshot
                                                                          .data!
                                                                          .docs[
                                                                              index]
                                                                          .data()
                                                                      as dynamic)['point']
                                                                  .toString(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(child: Container()),
                                                  index == 0
                                                      ? Text("👑", style: r)
                                                      : index == 1
                                                          ? Text(
                                                              "🥈",
                                                              style: r,
                                                            )
                                                          : index == 2
                                                              ? Text(
                                                                  "🥉",
                                                                  style: r,
                                                                )
                                                              : Text(''),
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
                                                              builder:
                                                                  (context) =>
                                                                      Profile(
                                                                username: (snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                        .data()
                                                                    as dynamic)['username'],
                                                                point: (snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                        .data()
                                                                    as dynamic)['point'],
                                                                photo: (snapshot
                                                                        .data!
                                                                        .docs[index]
                                                                        .data()
                                                                    as dynamic)['photo'],
                                                                rank: index,
                                                              ),
                                                            )),
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors
                                                            .deepPurpleAccent,
                                                      ),
                                                      child: Text(
                                                        "View Profile",
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
