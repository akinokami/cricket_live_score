import 'dart:math';

import 'package:get/get.dart';
import 'package:live_score/models/news_model.dart';
import 'package:live_score/services/api_repo.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/utils/constants.dart';

class NewsController extends GetxController {
  final isLoading = false.obs;

  final RxList<NewsModel> newsList = <NewsModel>[].obs;
  int random = Random().nextInt(10);

  @override
  void onInit() async {
    // final box = GetStorage();
    // first.value = box.read('first') ?? '';
    // // if (first.value == '') {
    // //   PolicyDialog().showPolicyDialog();
    // // }
    await getNewsList();
    newsList
        .removeWhere((element) => (element.description ?? "").contains("…"));
    newsList.removeWhere((element) => (element.title ?? "")
        .contains("Ilija Trojanow und Klaus Zeyringers Buch „Fans“"));
    newsList.removeWhere((element) =>
        (element.urlToImage ?? "").startsWith("https://d.ibtimes.com/"));
    super.onInit();
  }

  @override
  void onReady() {
    //
  }

  @override
  void onClose() {
    //
  }

  Future<void> getNewsList() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getNewsList();
      if (result.isNotEmpty) {
        newsList.value =
            result.where((element) => (element.title != '[Removed]')).toList();
      }
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }
}
