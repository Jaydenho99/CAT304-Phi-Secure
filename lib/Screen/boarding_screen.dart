import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registerlogin/Screen/login_screen.dart';
import 'package:registerlogin/Screen/register_screen.dart';
import 'package:registerlogin/Screen/slide.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    // create a widget before making our home screen
    _currentPage = 0;
    _slides = [
      Slide("assets/lock.png",
          "Equip yourselves with latest knowledge of Phishing attacks"),
      Slide("assets/phishing.png",
          "Learn to identify various Phishing attacks before it is too late"),
      Slide("assets/scoreboard.png",
          "The application is equipped with leaderboard and scoreboard for user's engagement")
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  // the list which contain the build slides
  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  //build single slide
  Widget _buildSlide(Slide slide) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
          margin: EdgeInsets.all(32),
          child: Image.asset(slide.image, fit: BoxFit.contain),
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            slide.heading,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: 230,
        )
      ],
    );
  }

  // handling the page scrolling
  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        row.children.add(SizedBox(
          width: 12,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 8 : 5,
      height: index == _currentPage ? 8 : 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPage
            ? Color.fromRGBO(136, 144, 178, 1)
            : Color.fromRGBO(206, 209, 223, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: _handlingOnPageChanged,
            physics: BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                _buildPageIndicator(),
                SizedBox(
                  height: 32,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 5,
                      ),
                      child: Text(
                        "GET STARTED",
                        style: TextStyle(
                          letterSpacing: 4,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()))
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()))
                        }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
