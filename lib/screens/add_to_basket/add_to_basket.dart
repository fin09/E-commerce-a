import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToBasketPage extends StatefulWidget {
  const AddToBasketPage({super.key});
  static const String id = 'add_to_basket';

  @override
  State<AddToBasketPage> createState() => _AddToBasketPageState();
}

class _AddToBasketPageState extends State<AddToBasketPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    ProductModel? product;
    String? heroTag;

    if (args is Map) {
      product = args['product'] as ProductModel?;
      heroTag = args['heroTag'] as String?;
    } else if (args is ProductModel) {
      product = args;
      heroTag = 'recommended-${product.id}'; // Fallback
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section (Orange)
            Container(
              height: 0.4.sh,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.primary),
              child: Stack(
                children: [
                  Positioned(
                    top: 50.h,
                    left: 20.w,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 14.sp,
                              color: AppColors.textHeader,
                            ),
                            Text(
                              'Go back',
                              style: TextStyle(
                                color: AppColors.textHeader,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Hero(
                      tag: heroTag ?? 'product-${product?.id}',
                      child: product?.image.startsWith('http') == true
                          ? Image.network(
                              product!.image,
                              width: 200.w,
                              height: 200.h,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/food_hub.png',
                                  width: 200.w,
                                  height: 200.h,
                                );
                              },
                            )
                          : Image.asset(
                              'assets/images/food_hub.png',
                              width: 200.w,
                              height: 200.h,
                            ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Section (Content)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product?.title ?? 'Product Details',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textHeader,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _buildQuantityBtn(Icons.remove, () {
                            if (_quantity > 1) {
                              setState(() => _quantity--);
                            }
                          }),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              '$_quantity',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _buildQuantityBtn(Icons.add, () {
                            setState(() => _quantity++);
                          }),
                        ],
                      ),
                      Text(
                        '₦ ${(product?.price ?? 0.0) * _quantity}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textHeader,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Divider(),
                  SizedBox(height: 16.h),
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textHeader,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    product?.description ?? 'No description available.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textBody,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: CustomButton(
                          text: 'Add to basket',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '$_quantity ${product?.title} added to basket!',
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20.sp, color: AppColors.textHeader),
      ),
    );
  }
}
