import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/routes/app_routoes.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_textF.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});
  static const String id = 'payment_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Basket',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextF(
                      text: "Card Holder's Name",
                      hintText: "Adolphus Chris",
                    ),
                    SizedBox(height: 20.h),
                    CustomTextF(
                      text: "Card Number",
                      hintText: "1234 5678 9012 1314",
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextF(text: "Date", hintText: "10/30"),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: CustomTextF(
                            text: "CCV",
                            hintText: "123",
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100.h),
                    CustomButton(
                      text: 'Complete Order',
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.orderComplete),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
