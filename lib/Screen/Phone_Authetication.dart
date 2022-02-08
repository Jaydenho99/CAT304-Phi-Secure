import 'package:flutter/material.dart';
import 'package:registerlogin/Screen/OTP_screen.dart';

class phone_auth extends StatefulWidget {
  const phone_auth({Key? key}) : super(key: key);

  @override
  _phone_authState createState() => _phone_authState();
}

class _phone_authState extends State<phone_auth> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: Text("Phone Authentication",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+1'),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            )
          ]),
          Container(
            margin: EdgeInsets.all(10),
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
                "Verify",
                style: TextStyle(
                  letterSpacing: 4,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OTP_Screen(_controller.text)))
              },
            ),
          )
        ],
      ),
    );
  }
}
