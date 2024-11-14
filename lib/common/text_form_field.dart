import 'package:flutter/material.dart';
import 'package:nikkle_app/const/color_const.dart';

class CommonTextFormField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  const CommonTextFormField(
      {super.key,
      required this.hintText,
      this.controller,
      this.isObscureText = false,
      this.focusNode,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: isObscureText,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        labelText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor),
      ),
    );
  }
}
