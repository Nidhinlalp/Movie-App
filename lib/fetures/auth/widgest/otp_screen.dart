import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:movie_app/constants/color/color.dart';
import 'package:movie_app/fetures/home/screens/home_screen.dart';

import '../repository/auth_repository.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.verificationId});
  final String verificationId;

  final AuthRepository _authRepository = AuthRepository();

  void verifyOTP(BuildContext context, String userOTP) {
    _authRepository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        title: const Text('OTP Verification'),
        centerTitle: true,
        backgroundColor: black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text('Verify your OTP'),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: OtpTextField(
                  textStyle: const TextStyle(color: white),
                  focusedBorderColor: Colors.amber,
                  cursorColor: Colors.amber,
                  numberOfFields: 6,
                  borderColor: Colors.amber,
                  showFieldAsBox: true,
                  keyboardType: TextInputType.number,
                  onSubmit: (val) {
                    if (val.length == 6) {
                      verifyOTP(context, val.trim());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Did'nt received a code?"),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Resend OTP",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
