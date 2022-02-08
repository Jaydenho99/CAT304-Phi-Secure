import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTP_Screen extends StatefulWidget {
  final String phone;
  OTP_Screen(this.phone);
  @override
  _OTP_ScreenState createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: const Color.fromRGBO(126, 203, 224, 1)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                "Verify +60${widget.phone}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: PinPut(
              fieldsCount: 4,
              textStyle: const TextStyle(fontSize: 25, color: Colors.white),
              eachFieldWidth: 40,
              eachFieldHeight: 55,
              //onSubmit: (String pin) => _showSnackBar(pin),
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
            ),
          ),
        ],
      ),
    );
  }

  _verifyPhone() async{
    await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: "+60${widget.phone}", 
    verificationCompleted: null, 
    verificationFailed: null, 
    codeSent: (String verificationID, int resendToken){
      setState(() {
        _verificationCode= verificationID;
      });
    }, 
    codeAutoRetrievalTimeout: null)
  }
}
