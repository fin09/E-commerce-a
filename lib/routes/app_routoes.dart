// app_routes.dart
import 'package:ecommerce/screens/welcome/weclome_screen.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppRoutes {
  static const welcome        = '/welcome';
  static const auth           = '/auth';
  static const home           = '/home';
  static const addToBasket    = '/basket';
  static const completeDetails= '/complete-details';
  static const orderComplete  = '/order-complete';
  static const trackOrder     = '/track-order';
  static const orderList      = '/order-list';
  static const inputCard      = '/input-card';

  static Map<String, WidgetBuilder> get routes => {
    welcome: (context) => const WelcomeScreen(),
    // sgin: (context) => const AuthPage(),
    // home: (context) => const HomePage(),
    // addToBasket: (context) => const AddToBasketPage(),
    // completeDetails: (context) => const CompleteDetailsPage(),
    // orderComplete: (context) => const OrderCompletePage(),
    // trackOrder: (context) => const TrackOrderPage(),
    // orderList: (context) => const OrderListPage(),
    // inputCard: (context) => const InputCardPage(),
  };
}