import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/routes/app_routoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.product, this.heroTag});
  final ProductModel product;
  final String? heroTag;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.05),
      child: Container(
        width: 150.w,
        padding: EdgeInsets.all(12.w),
        child: Stack(
        children: [
          // Heart Icon (Top Right)
          Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.favorite_border,
              color: Colors.orangeAccent,
              size: 20.sp,
            ),
          ),

          // Main Content
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: Image.network(
                    product.image,
                    height: 80.h,
                    width: 80.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 80.h,
                        width: 80.w,
                        color: Colors.grey[100],
                        padding: EdgeInsets.all(10.w),
                        child: Image.asset(
                          'assets/images/food_hub.png',
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              // Product Title
              Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF27214D),
                ),
              ),
              SizedBox(height: 8.h),

              // Price and Add Button row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₦ ${product.price}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF08626),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.addToBasket,
                        arguments: {
                          'product': product,
                          'heroTag': heroTag ?? 'recommended-${product.id}',
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFAEB),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: const Color(0xFFF08626),
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      )
    );
  }
}
