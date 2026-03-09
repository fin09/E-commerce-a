import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/routes/app_routoes.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});
  static const String id = 'order_list';

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
          'My Basket',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(20.w),
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemBuilder: (context, index) {
                return _buildBasketItem(
                  [
                    'Quinoa Fruit Salad',
                    'Melon Fruit Salad',
                    'Tropical Fruit Salad',
                  ][index],
                  '2 packs',
                  ['₦ 20,000', '₦ 20,000', '₦ 20,000'][index],
                  'assets/images/food_hub.png',
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textHeader,
                      ),
                    ),
                    Text(
                      '₦ 60,000',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textHeader,
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  text: 'Checkout',
                  width: 180.w,
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.completeDetails),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasketItem(
    String title,
    String subtitle,
    String price,
    String image,
  ) {
    return Row(
      children: [
        Container(
          width: 65.w,
          height: 65.h,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(child: Image.asset(image, width: 45.w)),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textHeader,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14.sp, color: AppColors.textBody),
              ),
            ],
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textHeader,
          ),
        ),
      ],
    );
  }
}
