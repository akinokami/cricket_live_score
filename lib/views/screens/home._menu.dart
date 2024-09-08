import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_score/controller/home_controller.dart';
import 'package:live_score/views/screens/matches/matches_screen.dart';
import 'package:live_score/views/screens/news/news_screen.dart';
import 'package:live_score/views/screens/results/result_screen.dart';
import 'package:live_score/views/screens/upcoming/upcoming_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height:landingPageController.isShow.value? 120.h:65.h,
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(8.w),
                child: GestureDetector(
                  onTap: (){
                    print("Banner Clicked");

                  },
                  child: Image.asset("assets/banner1.webp",
                      width: double.infinity,
                      height: landingPageController.isShow.value? 47.h:0,
                      fit: BoxFit.fill),
                ),
              ),
              BottomNavigationBar(
                showUnselectedLabels: true,
                showSelectedLabels: true,
                onTap: landingPageController.changeTabIndex,
                currentIndex: landingPageController.tabIndex.value,
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                unselectedItemColor: Colors.white.withOpacity(0.5),
                selectedItemColor: Colors.white,
                unselectedLabelStyle: unselectedLabelStyle,
                selectedLabelStyle: selectedLabelStyle,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.newspaper_outlined,
                        size: 20.0,
                      ),
                    ),
                    label: 'News',
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.view_timeline_outlined,
                        size: 20.0,
                      ),
                    ),
                    label: 'Matches',
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.calendar_month_outlined,
                        size: 20.0,
                      ),
                    ),
                    label: 'Upcoming',
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.history,
                        size: 20.0,
                      ),
                    ),
                    label: 'Results',
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                ],
              ),

            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        Get.put(HomeController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, homeController),
      body: Obx(() => IndexedStack(

            index: homeController.tabIndex.value,
            children: [
              NewsScreen(),
              MatchesScreen(),
              UpcomingScreen(),
              ResultScreen(),
            ],
          )),
    ));
  }
}
