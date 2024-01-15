import 'package:flutter/material.dart';

import 'package:flutter_cab/viewpages/reset_password_screen.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 233, 226, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Center(
                      child: Image.asset('assets/images/Asset 233000 1.png')),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Verify OTP',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Enter the OTP sent to your email',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    onChanged: (value) {
                      // Handle changes in the OTP input
                      print(value);
                    },
                    onCompleted: (value) {
                      // Handle when the user completes entering the OTP
                      print("Completed: $value");
                    },
                    // You can customize the appearance of the input field
                    pinTheme: PinTheme(
                        selectedFillColor: Colors.white,
                        shape: PinCodeFieldShape.box,
                        inactiveFillColor: Colors.white,
                        activeFillColor: Colors.white,
                        inactiveColor: Colors.grey,
                        activeColor: Color.fromRGBO(0, 0, 0, 0.5),
                        borderRadius: BorderRadius.circular(10)),
                    controller: _otpController,
                    // Validator function for OTP
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the OTP';
                      }
                      if (value.length != 6) {
                        return 'OTP must be 6 digits long';
                      }
                      // You can add more custom validation here if needed
                      return null;
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(123, 30, 52, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11)))),
                    onPressed: () {
                      if (_otpController.text.isEmpty) {
                        setState(() {});
                      } else if (_otpController.text.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('otp verified')));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPasswordScreen()));
                      }
                    },
                    child: Text(
                      'Verify Otp',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code?",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 10),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: () {}, child: Text('Resend Otp'))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
