import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});
  static const String id = 'track_order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Delivery Status',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            _buildStatusItem(Icons.list_alt, 'Order Taken', true, true),
            _buildStatusItem(
              Icons.outdoor_grill,
              'Order Is Being Prepared',
              true,
              true,
            ),
            _buildStatusItem(
              Icons.delivery_dining,
              'Order Is Being Delivered',
              false,
              true,
              subtitle: 'Your delivery agent is coming',
              showCall: true,
            ),
            _buildMapPlaceholder(), // Placeholder for the map
            _buildStatusItem(
              Icons.check_circle,
              'Order Received',
              false,
              false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(
    IconData icon,
    String title,
    bool isDone,
    bool showLine, {
    String? subtitle,
    bool showCall = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: isDone ? Colors.green.shade50 : AppColors.accent,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: isDone ? AppColors.success : AppColors.primary,
                size: 24.sp,
              ),
            ),
            if (showLine)
              Container(
                width: 2.w,
                height: 50.h,
                color: isDone ? AppColors.primary : Colors.orange.shade100,
              ),
          ],
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textHeader,
                    ),
                  ),
                  if (isDone)
                    Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                      size: 20.sp,
                    ),
                ],
              ),
              if (subtitle != null) ...[
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14.sp, color: AppColors.textBody),
                ),
              ],
            ],
          ),
        ),
        if (showCall)
          IconButton(
            icon: Icon(Icons.phone, color: AppColors.primary),
            onPressed: () {},
          ),
      ],
    );
  }

  Widget _buildMapPlaceholder() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(
          image: AssetImage(
            'assets/images/welcome.png',
          ), // Using existing image as placeholder
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.1),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Icon(Icons.location_on, color: AppColors.primary, size: 40.sp),
      ),
    );
  }
}
