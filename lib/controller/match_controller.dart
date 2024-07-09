import 'dart:async';

import 'package:get/get.dart';
import 'package:live_score/models/live_match_model.dart';
import 'package:live_score/models/match_model.dart';
import 'package:live_score/services/api_repo.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/utils/constants.dart';

class MatchController extends GetxController {
  final isLoading = false.obs;

  final RxList<MatchModel> overviewList = <MatchModel>[].obs;
  final current = 0.obs;
  final RxList<LiveMatchModel> liveList = <LiveMatchModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getLiveList();
    await getOverviewList();
  }

  @override
  void onReady() {
    // Timer.periodic(const Duration(seconds: 7), (timer) async {
    //   await getLiveList();
    // });
  }

  @override
  void onClose() {
    //
  }

  Future<void> getLiveList() async {
    // isLoading.value = true;
    try {
      final result = await ApiRepo().getLiveList();
      liveList.value = result;
      print(liveList.length);
      print(liveList.length);
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOverviewList() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getOverviewList();
      overviewList.value = result;
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }
}
