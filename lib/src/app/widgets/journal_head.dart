import 'package:fitapp/gen/assets.gen.dart';
import 'package:fitapp/src/app/themes/app_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DarkenedImageWithText extends StatefulWidget {
  final String imageUrl;
  final String text;
  final double? height;

  const DarkenedImageWithText({
    Key? key,
    required this.imageUrl,
    required this.text,
    this.height,
  }) : super(key: key);

  @override
  _DarkenedImageWithTextState createState() => _DarkenedImageWithTextState();
}

class _DarkenedImageWithTextState extends State<DarkenedImageWithText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth fade effect
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 250,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), // Darken the image
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: AppTypography().heading1.copyWith(
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SvgPicture.asset(Assets.icons.linearprogess),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.footwhite),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: " 7200", // The number part
                          style: AppTypography().heading1.copyWith(
                            color: CupertinoColors.white,
                            fontSize: 42,
                          ),
                        ),
                        TextSpan(
                          text: " steps", // The "steps" part
                          style: AppTypography().body1.copyWith(
                            color: CupertinoColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
