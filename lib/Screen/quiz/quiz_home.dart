import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. What is phishing?',
      'answers': [
        {'text': 'Scams through websites', 'score': -2},
        {'text': 'Scams through phone calls', 'score': -2},
        {'text': 'Scams through emails', 'score': 10},
        {'text': 'Scam through text messages', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q2. Sara finds a message on her phone that she thinks might be a scam. She should ...?',
      'answers': [
        {
          'text':
              'Forward the message to her friends to see if they think it is a scam too',
          'score': -2
        },
        {'text': 'Reply and ask the sender not to send more mail', 'score': -2},
        {'text': 'Call the scammer', 'score': -2},
        {'text': 'Delete the message', 'score': 10},
      ],
    },
    {
      'questionText':
          ' Q3. When people send you phony emails, pop-up messages, social media messages, texts, calls, or links to fake websites in order to hook you into giving out your personal and financial information.',
      'answers': [
        {'text': 'Plagiarizing', 'score': -2},
        {'text': 'Phishing', 'score': 10},
        {'text': 'Skimming', 'score': -2},
        {'text': 'Identity Theft', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q4. Teens are some of the most frequent targets of identity theft and other scams. Why?',
      'answers': [
        {
          'text':
              'Identity thieves look for “clean” Social Security numbers that haven’t yet been used to get credit.',
          'score': 10
        },
        {'text': 'It will help teens do better in school', 'score': -2},
        {
          'text': 'Thieves want to help teens get student loans for college',
          'score': -2
        },
        {
          'text':
              'Identity thieves are just testing teens to see if they will fall for their scams',
          'score': -2
        },
      ],
    },
    {
      'questionText':
          'Q5. They may get into your computer or another computer system, including schools, credit card companies, and other places maintaining personal information.',
      'answers': [
        {'text': 'Hacking', 'score': 10},
        {'text': 'Hoping', 'score': -2},
        {'text': 'Heaving', 'score': -2},
        {'text': 'Heckling', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q6. Pretending to be banks, the IRS or some other organization and sending you an email or a letter (or even make a phone call) asking for personal information is called',
      'answers': [
        {'text': 'Phishing', 'score': 10},
        {'text': 'Surfing', 'score': -2},
        {'text': 'Fishing', 'score': -2},
        {'text': 'Sailing', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q7. To prevent identity theft use one of these on credit card, bank and cell phone accounts.',
      'answers': [
        {'text': 'Password', 'score': 10},
        {'text': 'Combination lock', 'score': -2},
        {'text': 'A piece of tape to cover up the number', 'score': -2},
        {'text': 'A fake name', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q8. Never give this out over the phone, through email or on the Internet.',
      'answers': [
        {'text': 'Personal Information', 'score': 10},
        {'text': 'Free money', 'score': -2},
        {'text': "Tomorrow's lunch choices", 'score': -2},
        {'text': 'Baseball scores', 'score': -2},
      ],
    },
    {
      'questionText': 'Q9. What is a phishing scam?',
      'answers': [
        {'text': 'Someone pretending to be a legitimate business', 'score': 10},
        {'text': 'Someone trying to log your keys', 'score': -2},
        {'text': 'Someone sending you a virus', 'score': -2},
        {'text': 'YOU SPELLED FISHING WRONG SIR!', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q10. What is the most common way to receive a phishing scam?',
      'answers': [
        {'text': 'Email', 'score': 10},
        {'text': 'Text message', 'score': -2},
        {'text': 'Downloading films', 'score': -2},
        {'text': 'Unsafe websites', 'score': -2},
      ],
    },
    {
      'questionText': 'Q11. Which is NOT a phishing feature?',
      'answers': [
        {'text': 'addressed to you', 'score': 10},
        {'text': 'sense of urgency', 'score': -2},
        {'text': 'link to website', 'score': -2},
        {'text': 'generic greeting', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q12. Phishers often develop __ websites for tricking users & filling their personal data.',
      'answers': [
        {'text': 'legitimate', 'score': 10},
        {'text': 'illegitimate', 'score': -2},
        {'text': 'genuine', 'score': -2},
        {'text': 'official', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q13. Which of the following type of data, phishers cannot steal from its target victims?',
      'answers': [
        {'text': 'apps installed in the mobile ', 'score': 10},
        {'text': 'bank details', 'score': -2},
        {'text': 'phone number', 'score': -2},
        {'text': 'passwords', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q14. Which of the following is not an example or type of phishing?',
      'answers': [
        {'text': 'Tracking', 'score': 10},
        {'text': 'Vishing', 'score': -2},
        {'text': 'Smishing', 'score': -2},
        {'text': 'Pharming', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q15. ___ is usually targeted by nature where the emails are exclusively designed to target any exact user.',
      'answers': [
        {'text': 'Spear phishing ', 'score': 10},
        {'text': 'Vishing', 'score': -2},
        {'text': 'Domain Phishing', 'score': -2},
        {'text': 'Algo-based Phishing', 'score': -2},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
