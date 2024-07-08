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
    super.onInit();
    await getNewsList();
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
      newsList.value = result;
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }
}
