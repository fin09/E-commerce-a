import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.width,
    this.height,
    this.borderRadius,
  });

  final String text;
  final Function()? onTap;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          ),
          elevation: 0,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
