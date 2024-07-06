import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_score/controller/upcoming_controller.dart';
import 'package:live_score/views/widgets/match_card_widget.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final upcomingController = Get.put(UpcomingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcomings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => upcomingController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: upcomingController.upcomingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MatchCardWidget(
                        matchModel: upcomingController.upcomingList[index],
                        status: 'Upcoming',
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
