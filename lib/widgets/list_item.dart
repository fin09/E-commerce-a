import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/routes/app_routoes.dart';
import 'package:ecommerce/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<ProductModel> products = [
  ProductModel(
    id: 1,
    description: "A delicious blend of honey and lime with fresh fruits.",
    category: "Combos",
    title: 'Honey lime combo',
    price: 2000,
    image:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=300&auto=format&fit=crop',
  ),
  ProductModel(
    id: 2,
    description: "Classic fruit salad with various seasonal fruits.",
    category: "Combos",
    title: 'Berry mango combo',
    price: 8000,
    image:
        'https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?q=80&w=300&auto=format&fit=crop',
  ),
  ProductModel(
    id: 3,
    description: "A refreshing burst of citrus and mixed berries.",
    category: "Combos",
    title: 'Quinoa fruit salad',
    price: 1500,
    image:
        'https://images.unsplash.com/photo-1543362906-acfc16c67564?q=80&w=300&auto=format&fit=crop',
  ),
];

class ListItem1 extends StatelessWidget {
  const ListItem1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.addToBasket,
                  arguments: products[index],
                );
              },
              child: CustomCard(product: products[index]),
            ),
          );
        },
      ),
    );
  }
}
