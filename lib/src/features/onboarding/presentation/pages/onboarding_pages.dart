import 'dart:developer';

import 'package:fitapp/gen/assets.gen.dart';
import 'package:fitapp/src/app/themes/app_palette.dart';
import 'package:fitapp/src/app/themes/app_typography.dart';
import 'package:fitapp/src/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:fitapp/src/features/splash_screen/pages/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:fitapp/src/app/core/dependancy-injection/injection_container.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late OnboardingBloc onboardingBloc;
  final PageController _pageController = PageController();
  int _currentPage = 0; // Track the current page index
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    onboardingBloc = sl<OnboardingBloc>();
    onboardingBloc.add(GetMotivationalMessagesEvent());
    // Initialize VideoPlayerController with a network URL
    _controller = VideoPlayerController.asset(
      Assets.vedios.splashVideo, // Replace with your video URL
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true); // Loop the video
      });

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Slide from bottom to top
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1), // Start below the screen
      end: Offset(0, 0), // End at the normal position
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Fade-in animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _currentPage != 2,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.teal,
          onPressed: () {
            if (_currentPage < 2) {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          label: Text("Next"),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Center(child: CircularProgressIndicator()), // Loading indicator
          Container(
            height: double.infinity, // Tint height
            color: Colors.black.withAlpha((0.6 * 255).toInt()),
// Semi-transparent black tint
          ),
          // Animated Page View for Onboarding Pages
          AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              return PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index; // Update current page index
                    if (_currentPage == 2) {
                      _animationController
                          .forward(); // Trigger animation on last page
                    } else {
                      _animationController.reverse(); // Reset animation
                    }
                  });
                },
                children: [
                  // First Screen: Introduction to Journaling
                  OnboardingPage(
                    title: "Start Journaling",
                    description:
                        "Write down your thoughts, feelings, and ideas every day.",
                    image: Assets.icons.appTutorials.keyName,
                  ),
                  // Second Screen: Motivational Message & Visualization

                  BlocBuilder<OnboardingBloc, OnboardingState>(
                    builder: (context, state) {
                      log('state $state');
                      if (state is OnboardingLoaded) {
                        return OnboardingPage(
                            image: Assets.icons.dashboardTutoiral.keyName,
                            title: "Stay Motivated",
                            description: state.messages.message);
                      }
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                  // Third Screen: Call to action to start journaling
                  OnboardingPage(
                    title: "Start Your Journey",
                    description:
                        "Tap below to start journaling and track your progress.",
                  ),
                ],
              );
            },
          ),
          _buildProgressIndicator(), // Call the progress indicator method
        ],
      ),
      bottomNavigationBar: _currentPage == 2
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(8),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashBoardScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 62,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: AppPalette.tealshade,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Start Journaling",
                          style: AppTypography().heading4.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }

  // Progress indicator with 3 lines
  Widget _buildProgressIndicator() {
    return Positioned(
      left: 30.0,
      bottom: 100.0, // Adjust this based on your layout
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(3, (index) {
          return AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 4),
            height: _currentPage == index ? 5 : 3, // Highlight current page
            width: 30,
            decoration: BoxDecoration(
              color: _currentPage == index
                  ? Colors.teal
                  : Colors.white.withAlpha((0.5 * 255).toInt()),
              borderRadius: BorderRadius.circular(2),
            ),
            duration: Duration(milliseconds: 300),
          );
        }),
      ),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  final String title;
  final String description;
  final String? image;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    this.image,
  });

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller with a longer duration for deeper fade
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Increased duration for a deeper fade
    );

    // Fade-in animation with a slower curve for a deeper fade effect
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start the fade-in animation when the page is loaded
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.image != null,
            child: Image.asset(
              widget.image ?? "",
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 40),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              widget.title,
              style: AppTypography().heading1.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              widget.description,
              style: AppTypography().subheading1.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
