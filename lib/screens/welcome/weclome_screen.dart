import 'package:ecommerce/routes/app_routoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 375.w,
            height: 530.h,
            color: const Color(0xFFFFA451),
            child: Image.asset('assets/images/welcome.png'),
          ),
          Text(
            "Welcome to our app!\nthis is a simple app to\nshow you how to use flutter\nwe have",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.sgin_in);
            },
            child: Text(
              'Get Started',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
