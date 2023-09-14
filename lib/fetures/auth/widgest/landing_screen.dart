import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/fetures/auth/screens/login_screen.dart';

import '../../../constants/widget/custum_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Movie App',
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),
              Lottie.asset('assets/loties/landing.json'),
              SizedBox(height: size.height / 2),
              CustomButton(
                text: 'CONTINUE',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
