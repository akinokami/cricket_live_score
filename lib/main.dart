import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/views/screens/home._menu.dart';
import 'package:live_score/views/screens/privacy_policy/privacy_policy_screen.dart';

void main() async {
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
