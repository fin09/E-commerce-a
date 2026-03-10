import 'package:ecommerce/app.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ecommerce/core/helper/cache_helper.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/shop_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("68511689-9237-4e15-a70a-5e8f54db9148");
  OneSignal.Notifications.requestPermission(true);
  await CacheHelper.init();
  // CacheHelper.saveData(key: 'isFirst', value: true);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ShopProvider())],
      child: const MyApp(),
    ),
  );
  FlutterNativeSplash.remove();
}
