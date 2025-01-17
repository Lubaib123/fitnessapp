import 'package:fitapp/gen/assets.gen.dart';
import 'package:fitapp/src/app/themes/app_palette.dart';
import 'package:fitapp/src/app/themes/app_typography.dart';
import 'package:fitapp/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DataCard extends StatelessWidget {
  const DataCard({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DashboardBloc>().add(GetHealthEvent());
    return BlocBuilder<DashboardBloc, DashboardState>(builder: (
      context,
      state,
    ) {
      return Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1), // Shadow color with opacity
              offset: Offset(0, 4), // Position of the shadow
              blurRadius: 6, // Blur radius
              spreadRadius: 0, // Spread radius
            ),
          ],
          gradient: AppPalette.cardbluegreen,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.icons.footwhite),
              Spacer(),
              AnimatedCounterText(
                  count:
                      state is DashboardLoaded ? (state.healthdata.steps) : 0),
              Text(
                "walk",
                style: AppTypography().body1.copyWith(
                      color: CupertinoColors.white,
                    ),
                // TextStyle(
                //   color: CupertinoColors.white,
                //   fontWeight: FontWeight.w500,
                //   fontSize: 14,
                // ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class AnimatedCounterText extends StatelessWidget {
  const AnimatedCounterText({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: 7200),
      duration: Duration(seconds: 1), // Animation duration
      builder: (context, value, child) {
        return RichText(
          text: TextSpan(
            text: "$count", // Animated number
            style: AppTypography().heading1.copyWith(
                  color: CupertinoColors.white,
                ),
            children: <TextSpan>[
              TextSpan(
                text: ' steps', // This part will be in normal font weight
                style: AppTypography().body2.copyWith(
                      color: CupertinoColors.white,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
