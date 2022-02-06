import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:static_grpc/static_grpc.dart';

class leaderboard extends StatefulWidget {
  const leaderboard({Key? key}) : super(key: key);

  @override
  _leaderboardState createState() => _leaderboardState();
}

class _leaderboardState extends State<leaderboard> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: users,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int countPlayers = snapshot.data!.docs.length;
          return SingleChildScrollView(
            child: Wrap(
              runSpacing: 10,
              spacing: 20,
              children: List.generate(countPlayers, (index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                int scoreTemp = (document.data() as dynamic)['point'];

                return Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        child: Center(
                          child: AutoSizeText((index + 1).toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                      ),
                      SizedBox(
                          width: 10,
                          height: 60,
                          child: DottedLine(
                            direction: Axis.vertical,
                          )),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        child: WidgetRoundedPhoto(
                          playerPhotoName:
                              (document.data() as dynamic)['photo'],
                          playerColor: (document.data() as dynamic)['couleur'],
                        ),
                      ),
                      SizedBox(width: 20),
                      AutoSizeText(
                        (document.data() as dynamic)['username'] + ' ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ((document.data() as dynamic)['point'] > 1)
                          ? AutoSizeText(
                              (document.data() as dynamic)['point'].toString() +
                                  '?',
                              style:
                                  TextStyle(fontSize: 16, fontFamily: 'SFMono'),
                            )
                          : SizedBox.shrink(),
                      (index + 1 == 1)
                          ? AutoSizeText(
                              '?',
                              style: TextStyle(fontSize: 16),
                            )
                          : SizedBox.shrink(),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: ClipPath(
                            clipper: StarClipper(14),
                            child: Container(
                              height: 150,
                              color: Colors.green,
                              child: Center(
                                  child: AutoSizeText(
                                (document.data() as dynamic)['point']
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: AutoSizeText(
                          (document.data() as dynamic)['point'].toString() +
                              ' pts',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                );
              }),
            ),
          );
        }
        throw 'kekL';
      },
    );
  }

  WidgetRoundedPhoto({playerPhotoName, playerColor}) {}
}
