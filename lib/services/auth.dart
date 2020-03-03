import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_flutter_t4H/screens/home.dart';

class AuthService {
  String countryCode;
  String phoneNo;
  String smsCode;
  static String verificationID;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // register user using phone no
  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetreive = (String id) {
      AuthService.verificationID = id;
    };

    final PhoneCodeSent smsCodeSent = (String id, [int token]) {
      AuthService.verificationID = id;
    };

    final PhoneVerificationCompleted success = (AuthCredential authCredential) {
      print('Verified.');
    };

    final PhoneVerificationFailed failed = (AuthException authExc) {
      print(authExc.message);
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: this.countryCode + this.phoneNo,
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: autoRetreive,
        codeSent: smsCodeSent,
        verificationCompleted: success,
        verificationFailed: failed);
  }

  signIn(BuildContext context) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationID, smsCode: smsCode);

    await _auth.signInWithCredential(credential).then((user) {
      print(user.user.uid);
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    }).catchError((e) {
      print('Auth Credential Error : $e');
    });
  }
}
