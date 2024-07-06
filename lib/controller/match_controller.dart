import 'package:get/get.dart';
import 'package:live_score/models/match_model.dart';
import 'package:live_score/services/api_repo.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/utils/constants.dart';

class MatchController extends GetxController {
  final isLoading = false.obs;

  final RxList<MatchModel> overviewList = <MatchModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getOverviewList();
  }

  @override
  void onReady() {
    //
  }

  @override
  void onClose() {
    //
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
