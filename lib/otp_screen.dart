
import 'package:flutter/material.dart';
import 'package:queue_pro_app/helpers/loading_functions.dart';

class OtpScreen extends StatefulWidget{
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState()  => _OtpScreenState();

}

class _OtpScreenState extends State<OtpScreen> with LoadingFunctions{
  TextEditingController _phoneInputController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _phoneInputController.text = "";
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
        Text(
          "Hello there",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Please enter your phone number. You will receive on OTP code for the verification process."),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          controller: _phoneInputController,
          decoration: InputDecoration(
              hintText: "Phone Number",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none
              ),
              fillColor: Colors.purple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.phone)),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _getOTPPressed(context);
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            "Get OTP",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }

  _getOTPPressed(context) async{
    if(_phoneInputController.text.isEmpty) {
        showLoadingError("Please enter phone number.");
    }else {
      showLoading();
      await Future.delayed(const Duration(seconds: 2));
      showLoadingSuccess();
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushNamed(context, '/verification');
    }
  }


}