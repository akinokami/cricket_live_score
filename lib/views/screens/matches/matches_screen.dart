import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:live_score/controller/match_controller.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/views/widgets/custom_text.dart';
import 'package:live_score/views/widgets/live_card_widget.dart';
import 'package:live_score/views/widgets/match_card_widget.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

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
      body: Obx(
        () => matchController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 225,
                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.6,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 7),
                        onPageChanged: (index, reason) {
                          matchController.current.value = index;
                        },
                      ),
                      items: matchController.liveList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: LiveCardWidget(
                                liveMatchModel: i,
                                status:
                                    i.result == "" ? 'Upcoming' : 'Finished',
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: AppTheme.mainColor.withOpacity(0.8),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: const CustomText(
                        text: 'Overview',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        textColor: AppTheme.white,
                      ),
                    ),
                  ),
                  Expanded(
                    //height: MediaQuery.of(context).size.height * 0.5,
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
                ],
              ),
      ),
    );
  }
}
