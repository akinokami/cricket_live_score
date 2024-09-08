import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/views/screens/home._menu.dart';
import 'package:live_score/views/widgets/custom_text.dart';

import '../../controller/home_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Obx(
          () => Stack(
            children: [
              if (!homeController.isShow.value)
                Container(
                  decoration: BoxDecoration(
                      //image: DecorationImage(image: AssetImage("assets/images/menuBg.webp"),fit: BoxFit.cover)
                      ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Image.asset(
                        "assets/launcher.webp",
                        width: 200.w,
                        height: 200.h,
                      )),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Please wait",
                            size: 20.sp,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CircularProgressIndicator()
                        ],
                      )
                    ],
                  ),
                ),
              // Ad Image
              if (homeController.isShow.value)
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Image.asset(
                      width: double.infinity,
                      height: double.infinity,
                      'assets/full_ad4.webp',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

              if (homeController.isShow.value)
                Positioned(
                  top: -10,
                  right: 7.5,
                  child: IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: AppTheme.closeIconColor,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              if (homeController.isShow.value)
                Positioned(
                  top: -10,
                  right: -13,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: AppTheme.closeIconColor,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              // if (homeController.isShow.value)
                // Positioned(
                //   bottom: 10,
                //   right: 10,
                //   child: GestureDetector(
                //     onTap: () {
                //       Get.offAll(Home());
                //     },
                //     child: Container(
                //       width: 150.w,
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 10, vertical: 15.h),
                //       decoration: BoxDecoration(
                //         color: AppTheme.closeIconColor,
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //       child: Center(
                //           child: CustomText(
                //         text: "Close",
                //         size: 14.sp,
                //         textColor: Colors.white,
                //         fontWeight: FontWeight.w500,
                //       )),
                //     ),
                //   ),
                // ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(()=>
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
    children: [
              (homeController.isShow.value)
              ? GestureDetector(
            onTap: () {
              Get.offAll(Home());
            },
            child: Container(
              width: 150.w,
              height: 50.h,
              margin: EdgeInsets.only(right: 10.w,bottom: 7.h,top: 5.h),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppTheme.closeIconColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                  child: CustomText(
                    text: "Close",
                    size: 14.sp,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),

            ),
          )
              : SizedBox.shrink()
    ],
    ),
        ));
  }
}
