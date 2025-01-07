import 'package:fitapp/src/app/themes/app_typography.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    super.key,
    this.labelname,
    required this.hinttext,
    this.prefxicon,
    required this.controller,
    this.prefixname,
    this.mandatoryicon,
    this.suffixicon,
    this.validator,
    this.keyboardtype,
    this.errortext,
    this.maxlength,
    this.obscureText,
    this.onChanged,
    this.enabled,
    this.autovalidateMode,
    this.readonly,
    this.focusNode,
    this.maxLines,
  });

  final String? labelname;
  final String hinttext;
  final Widget? prefxicon;
  final Widget? suffixicon;
  final TextEditingController controller;
  final String? prefixname;
  final bool? mandatoryicon;
  final FormFieldValidator? validator;
  final TextInputType? keyboardtype;
  final String? errortext;
  final int? maxlength;
  final AutovalidateMode? autovalidateMode;
  final void Function(String text)? onChanged;
  final bool? readonly;
  final bool? enabled;
  final int? maxLines;
  final bool? obscureText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly ?? false,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      controller: controller,
      style: const TextStyle(color: Colors.black, decorationThickness: 0),
      onChanged: onChanged,
      keyboardType: keyboardtype ?? TextInputType.name,
      validator: validator,
      maxLines: maxLines ?? 1,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        counter: const Offstage(),
        errorText: errortext,
        hintText: hinttext,
        hintStyle: AppTypography().heading4,

        prefixIcon: prefxicon,
        prefixText: prefixname,
        suffixIcon: suffixicon,
        labelText: labelname,
        filled: true,
        fillColor: const Color.fromARGB(255, 243, 239, 233),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.primaryFixedDim,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.primaryFixedDim,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.primaryFixedDim,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
