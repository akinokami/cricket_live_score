import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/views/screens/home._menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FastCachedImageConfig.init(
    clearCacheAfter: const Duration(days: 3),
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final box = GetStorage();
    // String first = box.read('first') ?? '';
    return GetMaterialApp(
      title: 'Live Score',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.mainColor,
          ),
        ),
      ),
      home: Home(), //: PrivacyPolicyScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
