import 'package:ecommerce/routes/app_routoes.dart';
import 'package:ecommerce/widgets/custom_textF.dart';
import 'package:ecommerce/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/widgets/drawer_app.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/shop_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "Hottest";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ShopProvider>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      appBar: AppBar1(),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 20.h,
                    ),
                    child: Text(
                      "Hello Tony,\nWhat fruit salad combo do you want today?",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomTextF(
                      text: "Search for fruit salad combos",
                      obscureText: false,
                      onChanged: (value) {
                        context.read<ShopProvider>().setSearchQuery(value);
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "Recommended Combo",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xFF27214D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const ListItem1(tagPrefix: 'recommended'),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryBtn(
                        "Hottest",
                        selectedCategory == "Hottest",
                        (cat) {
                          setState(() => selectedCategory = cat);
                        },
                      ),
                      _buildCategoryBtn(
                        "Popular",
                        selectedCategory == "Popular",
                        (cat) {
                          setState(() => selectedCategory = cat);
                        },
                      ),
                      _buildCategoryBtn(
                        "New combo",
                        selectedCategory == "New combo",
                        (cat) {
                          setState(() => selectedCategory = cat);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  const ListItem1(tagPrefix: 'category'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBtn(
    String title,
    bool isSelected,
    Function(String) onTap,
  ) {
    return TextButton(
      onPressed: () => onTap(title),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              color: isSelected ? Colors.orange : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 4.h),
              height: 2.h,
              width: 20.w,
              color: Colors.orange,
            ),
        ],
      ),
    );
  }
}

class AppBar1 extends StatelessWidget implements PreferredSizeWidget {
  const AppBar1({super.key});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu, color: Colors.black, size: 24.w),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        Column(
          children: [
            IconButton(
              icon: Image.asset(
                'assets/images/shipping_cart.png',
                width: 24.w,
                height: 24.h,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.orderList);
              },
            ),
          ],
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text('Home'),
    );
  }
}
