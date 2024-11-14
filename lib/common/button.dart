import 'package:flutter/material.dart';
import 'package:nikkle_app/const/color_const.dart';

class CommonButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CommonButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(size.width, 50),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
