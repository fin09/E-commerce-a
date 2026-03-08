// app_routes.dart
import 'package:ecommerce/screens/add_to_basket/add_to_basket.dart';
import 'package:ecommerce/screens/complete_details/complete_details.dart';
import 'package:ecommerce/screens/home_srceen/home.dart';
import 'package:ecommerce/screens/sign_Up/register_page.dart';
import 'package:ecommerce/screens/sign_in/login_page.dart';
import 'package:ecommerce/screens/welcome/weclome_screen.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppRoutes {
  static const welcome        = '/welcome';
  static const sgin_in        = '/sgin_in';
  static const sgin_up        = '/sgin_up';
  static const home           = '/home';
  static const addToBasket    = '/basket';
  static const completeDetails= '/complete-details';
  static const orderComplete  = '/order-complete';
  static const trackOrder     = '/track-order';
  static const orderList      = '/order-list';
  static const inputCard      = '/input-card';

  static Map<String, WidgetBuilder> get routes => {
    welcome: (context) => const WelcomeScreen(),
     sgin_in: (context) => LoginPage(),
     sgin_up: (context) => RegisterPage(),
    home: (context) => const HomePage(),
    addToBasket: (context) => const AddToBasketPage(),
    completeDetails: (context) => const CompleteDetailsPage(),
    // orderComplete: (context) => const OrderCompletePage(),
    // trackOrder: (context) => const TrackOrderPage(),
    // orderList: (context) => const OrderListPage(),
    // inputCard: (context) => const InputCardPage(),
  };
}
