// ignore_for_file: must_be_immutable

import 'package:fitapp/src/app/resources/emoji_data.dart';
import 'package:fitapp/src/app/themes/app_palette.dart';
import 'package:flutter/material.dart';

class Emojishower extends StatelessWidget {
  Emojishower({
    super.key,
    required this.selectedMood,
    required this.focusedemoiji,
    required this.index,
  });
  int index;
  final Emoji? selectedMood;
  final Emoji? focusedemoiji;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: (selectedMood?.id == emojis[index].id)
            ? null // Set to null because we'll use the gradient instead
            : (focusedemoiji?.id == emojis[index].id)
                ? AppPalette.white
                : Colors.transparent,
        gradient: (selectedMood?.id == emojis[index].id)
            ? AppPalette.cardbluegreen
            : null, // No gradient when the condition is not met
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.white30, blurRadius: 2, offset: Offset(0, 4)),
        ],
      ),
      child: Image.asset(
        emojis[index].assetPath, // Ensure the asset paths are correct
        fit: BoxFit.cover,
      ),
    );
  }
}
