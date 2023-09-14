import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/constants/color/color.dart';
import 'package:movie_app/fetures/auth/widgest/landing_screen.dart';

import '../../home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _secureStorage = const FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, checkUserExists);
  }

// Check if the user exists in secure storage
  Future<void> checkUserExists() async {
    final userExists = await _secureStorage.read(key: 'currentUserId');

    if (userExists != null && context.mounted) {
      // User exists, navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      // User does not exist, navigate to the landing screen
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LandingScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Container(
          child: Lottie.asset('assets/loties/landing.json'),
        ),
      ),
    );
  }
}
