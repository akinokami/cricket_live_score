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
          text: 'Matches',
          size: 16,
          fontWeight: FontWeight.w500,
          textColor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomText(text: 'Cricket Live'),
            SizedBox(
              height: 10,
            ),
            CustomText(text: 'Overview'),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => matchController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
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
      ),
    );
  }
}
