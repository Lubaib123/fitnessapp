import 'package:fitapp/src/app/themes/app_themes.dart';
import 'package:fitapp/src/features/splash_screen/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class FitnessApp extends StatefulWidget {
  const FitnessApp({super.key});

  @override
  State<FitnessApp> createState() => _FitnessAppState();
}

class _FitnessAppState extends State<FitnessApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      home: SplashScreen(),

      // routerConfig: AppPagesConfig().router,
    );
  }
}
