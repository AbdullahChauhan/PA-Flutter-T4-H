import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class User {
  const User({@required this.uid});
  final String uid;
}

class AuthService {
  String countryCode;
  String phoneNo;
  String smsCode;
  static String verificationID;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user == null ? null : User(uid: user.uid);
  }

  Stream<User> get onAuthStateChanged {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

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

  Future<User> signIn(BuildContext context) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationID, smsCode: smsCode);

    final authResult = await _auth.signInWithCredential(credential);
    return _userFromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
