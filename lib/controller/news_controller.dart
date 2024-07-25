import 'dart:math';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:live_score/models/news_model.dart';
import 'package:live_score/services/api_repo.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/utils/constants.dart';
import 'package:live_score/views/screens/privacy_policy/policy_dialog.dart';

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
            result.where((element) => (element.title != '[Removed]')|| !((element.description??"").contains("…"))).toList();

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
