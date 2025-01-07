import 'package:fitapp/src/app/core/dependancy-injection/injection_container.dart';
import 'package:fitapp/src/app/themes/app_themes.dart';
import 'package:fitapp/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:fitapp/src/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:fitapp/src/features/splash_screen/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FitnessApp extends StatefulWidget {
  const FitnessApp({super.key});

  @override
  State<FitnessApp> createState() => _FitnessAppState();
}

class _FitnessAppState extends State<FitnessApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<OnboardingBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<DashboardBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowMaterialGrid: false,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.light,
        home: SplashScreen(),

        // routerConfig: AppPagesConfig().router,
      ),
    );
  }
}
