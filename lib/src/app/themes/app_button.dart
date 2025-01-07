import 'package:fitapp/src/app/themes/app_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.isEnable,
    required this.title,
    required this.onTap,
  });

  final bool isEnable;
  final String title;
  final VoidCallback onTap;
  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(8),
      onPressed:
          widget.isEnable
              ? () {
                widget.onTap();
              }
              : null,
      child: Container(
        height: 62,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:
              !widget.isEnable
                  ? LinearGradient(
                    colors: [
                      CupertinoColors.systemGrey,
                      CupertinoColors.systemGrey3,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                  : LinearGradient(
                    colors: [const Color(0xff23b6e6), const Color(0xff02d39a)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: AppTypography().heading3.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
