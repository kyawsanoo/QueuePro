import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:queue_pro_app/helpers/loading_functions.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();

}

class _VerificationScreenState extends State<VerificationScreen> with LoadingFunctions{

  String _otpVerificationCode = "";

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              body: Container(
                  margin: const EdgeInsets.all(24),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      _header(context),
                      _inputField(context),

                  ],
                  ),
              ),
          ),

      );
}


_header(context) {
    return const Column(
        children: [
            Text("OTP code verification", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text("We have sent OTP code to your phone number *** *** ***. Enter the OTP code below to continue."),
        ],
    );
}

_inputField(context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        OtpTextField(
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
              //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
              _otpVerificationCode = verificationCode;
              /*showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: const Text("Verification Code"),
                                  content: Text('Code entered is $verificationCode'),
                                );
                              }
                          );*/
              _verifyOTP(context);
              }, // end onSubmit
          ),
          const SizedBox(height: 30),
          ElevatedButton(
                onPressed: () async {
                    _verifyOTP(context);
                },
                style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
            ),
            child: const Text("Verify", style: TextStyle(fontSize: 20, color: Colors.white),
                ),
          )
    ],
    );
}

_verifyOTP(context) async{
  if(_otpVerificationCode.isEmpty) {
    showLoadingError("Enter verification code");
  }else {
    showLoading();
    await Future.delayed(const Duration(seconds: 2));
    showLoadingSuccess();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushNamed(context, '/complete_profile');
  }
}


}