import 'package:get/get.dart';
import 'package:live_score/models/odd_model.dart';
import 'package:live_score/models/player_model.dart';
import 'package:live_score/models/summary_model.dart';
import 'package:live_score/services/api_repo.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/utils/constants.dart';

class MatchDetailController extends GetxController {
  final isLoading = false.obs;

  final RxList<PlayerModel> scoreList = <PlayerModel>[].obs;
  final RxList<PlayerModel> filterScoreList = <PlayerModel>[].obs;

  final RxList<OddModel> oddList = <OddModel>[].obs;
  final RxList<OddModel> filterOddList = <OddModel>[].obs;

  final RxList<SummaryModel> summaryList = <SummaryModel>[].obs;

  final matchId = "".obs;
  final title = "".obs;
  final teamA = "".obs;
  final teamB = "".obs;
  RxList<String> teamList = <String>[].obs;

  @override
  void onInit() async {
    super.onInit();
    matchId.value = Get.arguments['matchId'].toString();
    title.value = Get.arguments['title'].toString();
    teamA.value = Get.arguments['teamA'].toString();
    teamB.value = Get.arguments['teamB'].toString();
    teamList.value = [teamA.value, teamB.value];

    await getScore();
    await getOdd();
    await getSummary();
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
      filterScore(teamA.value);
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  void filterScore(String teamName) {
    filterScoreList.value = [];
    filterScoreList.value =
        scoreList.where((element) => element.teamName == teamName).toList();
  }

  Future<void> getOdd() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getOdd(matchId.value);
      oddList.value = result;
      filterInning('1');
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  void filterInning(String inning) {
    print(inning);
    filterOddList.value = [];
    filterOddList.value =
        oddList.where((element) => element.isfirstinning == inning).toList();
  }

  Future<void> getSummary() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getSummary(matchId.value);
      summaryList.value = result;
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }
}
