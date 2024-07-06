import 'package:get/get.dart';
import 'package:live_score/models/player_model.dart';
import 'package:live_score/services/api_repo.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/utils/constants.dart';

class MatchDetailController extends GetxController {
  final isLoading = false.obs;

  final RxList<PlayerModel> scoreList = <PlayerModel>[].obs;
  final matchId = "".obs;

  @override
  void onInit() async {
    super.onInit();
    await getScore();
  }

  @override
  void onReady() {
    //
  }

  @override
  void onClose() {
    //
  }

  Future<void> getScore() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getScore(matchId.value);
      scoreList.value = result;
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOdd() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getScore(matchId.value);
      scoreList.value = result;
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }
}
