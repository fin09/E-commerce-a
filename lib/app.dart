import 'package:ecommerce/core/helper/cache_helper.dart';
import 'package:ecommerce/core/theme/app_theme.dart';
import 'package:ecommerce/routes/app_routoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fruit Salad App',
          theme: AppTheme.lightTheme,

          initialRoute: CacheHelper.getBool(key: 'isFirst') == false
              ? AppRoutes.home
              : AppRoutes.welcome,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
