import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_score/utils/app_theme.dart';

class PolicyDialog {
  void showPolicyDialog() {
    Get.defaultDialog(
        title: "Privacy Policy",
        backgroundColor: Colors.black,
        // titleStyle: TextStyle(color: Colors.white),
        // middleTextStyle: TextStyle(color: Colors.white),
        textConfirm: "Confirm",
        // textCancel: "Cancel",
        // cancelTextColor: Colors.white,
        confirmTextColor: Colors.white,
        buttonColor: AppTheme.mainColor,
        barrierDismissible: false,
        radius: 50,
        content: Column(
          children: [
            Container(child: Text("Hello 1")),
            Container(child: Text("Hello 2")),
            Container(child: Text("Hello 3")),
          ],
        ));
  }
}
