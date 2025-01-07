import 'dart:async';

import 'package:fitapp/gen/assets.gen.dart';
import 'package:fitapp/src/features/onboarding/presentation/pages/onboarding_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start navigation timer when SplashScreen is initialized
    _navigateToOnboarding();
  }

  // Function to handle navigation after the timer
  void _navigateToOnboarding() {
    Timer(const Duration(milliseconds: 2000), () {
      if (mounted) {
        // Navigation to OnboardingScreen after 3 seconds
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => OnboardingScreen()),
          (route) => false, // Remove all previous routes from the stack
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        // Display Lottie animation
        child: Lottie.asset(
          Assets.lottie.animation17357481640912, // Path to the Lottie file

          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
