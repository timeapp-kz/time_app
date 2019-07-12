import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:time_app/bloc/bloc_provider.dart';

class AuthorizationBloc implements BlocBase {
  String _verificationId;

  @override
  void dispose() {}


  void sendCode(String phoneNumber) async {


    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential authCredential) {
      print('verified');
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException exception) {
      print('${exception.message}');
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout =
        (String verificationId) {
      this._verificationId = verificationId;
    };

    final PhoneCodeSent smsCodeSent =
        (String verificationId, [int forceCodeResend]) {
      this._verificationId = verificationId;
    };

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeAutoRetrievalTimeout: autoRetrievalTimeout,
        codeSent: smsCodeSent,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        timeout: const Duration(seconds: 5),
      );
    } catch(error) {
      print('EXCEPTION: ' + error.message);
    }
  }

  void signIn(String smsCode) async {
    try {
      AuthCredential authCredential = PhoneAuthProvider.getCredential(verificationId: this._verificationId, smsCode: smsCode);

      final FirebaseUser user = await FirebaseAuth.instance.signInWithCredential(authCredential);
      final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
      assert(user.uid == currentUser.uid);

      print('======================================= ' + user.toString());
    } catch(error) {
      print('EXCEPTION: ' + error.message);
    }

  }


}
