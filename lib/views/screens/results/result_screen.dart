import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_score/controller/result_controller.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/views/screens/results/result_details_screen.dart';
import 'package:live_score/views/widgets/custom_text.dart';
import 'package:live_score/views/widgets/match_card_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resultController = Get.put(ResultController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        title: const CustomText(
          text: 'Results',
          size: 16,
          fontWeight: FontWeight.w500,
          textColor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Obx(
          () => resultController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: resultController.resultList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                           Get.to(() => ResultDetailsScreen(matchModel:resultController.resultList[index]));
                        },
                        child: MatchCardWidget(
                          matchModel: resultController.resultList[index],
                          status: 'Finished',
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
