import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:live_score/views/screens/home._menu.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  RxBool isShow = false.obs;
  RxString baseURL = "http://ip-api.com/json".obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
   Future.delayed(const Duration(seconds: 2),(){
      loadApi();
    });
    super.onInit();
  }

  loadApi() async {
    final response = await http.get(Uri.parse(baseURL.value));
    if (response.statusCode == 200) {
      Map<String, dynamic> loadCountryCodeRespond = jsonDecode(response.body);

      ///this one will replace with jump type
      if (loadCountryCodeRespond['countryCode'] == "PH" ||
          loadCountryCodeRespond['countryCode'] == "VN") {
        isShow.value = true;
        ///will load api to get final url
        print("Country code is ${loadCountryCodeRespond['countryCode']} and isShow is ${isShow.value}");
        //getFinalUrl();
      } else {
        isShow.value = false;
        Get.offAll(Home());
      }
    }
  }

  @override
  void dispose() {
    //
    super.dispose();
  }
}
