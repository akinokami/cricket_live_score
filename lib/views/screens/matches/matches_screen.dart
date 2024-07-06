import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_score/controller/match_controller.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/views/widgets/custom_text.dart';
import 'package:live_score/views/widgets/match_card_widget.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matchController = Get.put(MatchController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        title: const CustomText(
          text: 'Cricket Live',
          size: 16,
          fontWeight: FontWeight.w500,
          textColor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(
            () => SizedBox(
              child: CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 1.6,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        matchController.current.value = index;
                      }),
                  items: matchController.overviewList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          //decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                          //margin: const EdgeInsets.symmetric(horizontal: 5.0),

                          child: MatchCardWidget(
                            matchModel: i,
                            status: 'Finished',
                          ),
                        );
                      },
                    );
                  }).toList()),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: matchController.overviewList.asMap().entries.map((entry) {
          //     return GestureDetector(
          //       onTap: () =>
          //           matchController.controller.animateToPage(entry.key),
          //       child: Container(
          //         width: 12.0,
          //         height: 12.0,
          //         margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          //         decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: (Theme.of(context).brightness == Brightness.dark
          //                     ? Colors.white
          //                     : Colors.black)
          //                 .withOpacity(
          //                     matchController.current.value == entry.key
          //                         ? 0.9
          //                         : 0.4)),
          //       ),
          //     );
          //   }).toList(),
          // ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: CustomText(
            text: 'Overview',
            size: 16,
            fontWeight: FontWeight.w500,
            textColor: AppTheme.mainColor,
          )),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => matchController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: matchController.overviewList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MatchCardWidget(
                            matchModel: matchController.overviewList[index],
                            status: 'Finished',
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
