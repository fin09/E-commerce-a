import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextF extends StatelessWidget {
  const CustomTextF({
    super.key,
    required this.text,
    this.onChanged,
    this.obscureText = false,
    this.hintText,
    this.keyboardType,
    this.controller,
  });

  final String text;
  final String? hintText;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: AppColors.textHeader,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyle(color: AppColors.textHeader, fontSize: 14.sp),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.cardBackground,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
          ),
        ),
      ],
    );
  }
}
