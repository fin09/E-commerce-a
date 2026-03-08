import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({Key? key}) : super(key: key);
  static const String id = 'order_complete';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 160.w,
                height: 160.h,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.success,
                  size: 100.sp,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Congratulations!!!',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textHeader,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Your order has been taken and\nis being attended to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textBody,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 50.h),
              CustomButton(
                text: 'Track order',
                width: 160.w,
                onTap: () => Navigator.pushNamed(context, '/track-order'),
              ),
              SizedBox(height: 20.h),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(160.w, 56.h),
                  side: BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                ),
                child: Text(
                  'Continue shopping',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
