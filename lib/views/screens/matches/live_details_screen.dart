import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_score/controller/live_detail_controller.dart';
import 'package:live_score/views/widgets/custom_text.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../utils/app_theme.dart';

class ChipModel {
  final String title;
  final IconData icon;
  ChipModel({required this.title, required this.icon});
}

class LiveDetailsScreen extends StatefulWidget {
  const LiveDetailsScreen({super.key});

  @override
  State<LiveDetailsScreen> createState() => _LiveDetailsScreenState();
}

class _LiveDetailsScreenState extends State<LiveDetailsScreen> {
  final liveDetailController = Get.put(LiveDetailController());
  List<ChipModel> chipList = [
    ChipModel(title: 'Live Line', icon: Icons.live_tv),
    ChipModel(title: 'Score Card', icon: Icons.sports_cricket),
    ChipModel(title: 'Match Odds', icon: Icons.confirmation_num_outlined),
    ChipModel(title: 'Stats', icon: Icons.sports_baseball_sharp),
  ];

  int? selectedIndex = 0;
  int selectedIndex2 = 0;

  List<String> inningList = ['1st Innings', '2nd Innings'];
  int selectedInningIndex = 0;

  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      liveDetailController.getLiveLineLive();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String matchOddOne(String originalString) {
    int spaceIndex = originalString.indexOf(' ');
    int hyphenIndex = originalString.indexOf('-');

    // Determine which comes first: space or hyphen
    int separatorIndex = (spaceIndex == -1 || hyphenIndex < spaceIndex)
        ? hyphenIndex
        : spaceIndex;

    // Extract substring from start to separator
    String result = originalString.substring(0, separatorIndex);

    print(result);
    return result;
  }

  String matchOddTwo(String originalString) {
    // Find the position of the hyphen and the space
    originalString.replaceAll(' ', '');
    int hyphenIndex = originalString.indexOf('-');
    int spaceIndex = originalString.indexOf('|');

    // Extract substring from after the hyphen to the space
    String result = originalString.substring(hyphenIndex + 1, spaceIndex);

    print(result); // Outputs: 90
    return result;
  }

  String lastSixBall(String originalString) {
    String result = originalString.replaceAll('-', '       ');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          liveDetailController.title.value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .06,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            child: ListView.builder(
              itemCount: chipList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    if (selectedIndex == 0) {
                      liveDetailController.getLiveLine();
                    } else if (selectedIndex == 1) {
                      liveDetailController.getScore();
                    } else if (selectedIndex == 2) {
                      liveDetailController.getOdd();
                    } else if (selectedIndex == 3) {
                      liveDetailController.getSummary();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 2),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? AppTheme.mainColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(chipList[index].icon,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : AppTheme.mainColor),
                            SizedBox(
                              width: 5,
                            ),
                            Text(chipList[index].title,
                                style: TextStyle(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : AppTheme.mainColor)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (selectedIndex == 0)
            Obx(
              () => liveDetailController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : liveDetailController.liveLineList.isEmpty
                      ? const Center(
                          child: Text('No Data Found'),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: liveDetailController
                                                .liveLineList[0]
                                                .jsondata
                                                ?.jsondata
                                                ?.teamA ??
                                            '',
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            "${liveDetailController.liveLineList[0].jsondata?.jsondata?.imgurl ?? ''}${liveDetailController.liveLineList[0].jsondata?.jsondata?.teamABanner ?? ''}",
                                            width: 50,
                                            height: 50),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "${liveDetailController.liveLineList[0].jsondata?.jsondata?.imgurl ?? ''}${liveDetailController.liveLineList[0].jsondata?.jsondata?.teamBBanner ?? ''}",
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomText(
                                        text: liveDetailController
                                                .liveLineList[0]
                                                .jsondata
                                                ?.jsondata
                                                ?.teamB ??
                                            '',
                                        size: 12,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          AppTheme.mainColor.withOpacity(0.7)),
                                  color: AppTheme.mainColor.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomText(
                                          text: liveDetailController
                                                  .liveLineList[0]
                                                  .jsondata
                                                  ?.jsondata
                                                  ?.wicketA ??
                                              '',
                                          textColor: Colors.white,
                                          size: 13,
                                        ),
                                        CustomText(
                                          text: liveDetailController
                                                  .liveLineList[0]
                                                  .jsondata
                                                  ?.jsondata
                                                  ?.oversA ??
                                              '',
                                          textColor:
                                              Colors.white.withOpacity(0.5),
                                          size: 13,
                                        ),
                                      ],
                                    ),
                                    CustomText(
                                      text: liveDetailController.liveLineList[0]
                                              .jsondata?.jsondata?.score ??
                                          '',
                                      textColor: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      size: 13,
                                    ),
                                    CustomText(
                                      text: liveDetailController.liveLineList[0]
                                              .jsondata?.jsondata?.wicketB ??
                                          '',
                                      textColor: Colors.white,
                                      size: 13,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "C.R.R",
                                    size: 12,
                                  ),
                                  CustomText(
                                    text: "R.R.R",
                                    size: 12,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.yellow),
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                                child: CustomText(
                                  text: "Last 6 Balls",
                                  textColor: Colors.black,
                                  size: 12,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height:
                                    MediaQuery.of(context).size.height * .05,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          AppTheme.mainColor.withOpacity(0.7)),
                                  color: AppTheme.mainColor.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2),
                                      bottomRight: Radius.circular(2)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: lastSixBall(liveDetailController
                                              .liveLineList[0]
                                              .jsondata
                                              ?.jsondata
                                              ?.last6Balls ??
                                          ''),
                                      textColor: Colors.white,
                                      size: 13,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.yellow),
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                                child: CustomText(
                                  text: "Chances",
                                  textColor: Colors.black,
                                  size: 12,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height:
                                    MediaQuery.of(context).size.height * .15,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          AppTheme.mainColor.withOpacity(0.7)),
                                  color: AppTheme.mainColor.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2),
                                      bottomRight: Radius.circular(2)),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomText(
                                          text: liveDetailController
                                                  .liveLineList[0]
                                                  .jsonruns
                                                  ?.jsonruns
                                                  ?.fav ??
                                              '',
                                          textColor: Colors.white,
                                          size: 13,
                                        ),
                                        Column(
                                          children: [
                                            CustomText(
                                              text: "Market Odds",
                                              textColor: Colors.white,
                                              size: 13,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 23,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: CustomText(
                                                      text: matchOddOne(
                                                          liveDetailController
                                                                  .liveLineList[
                                                                      0]
                                                                  .jsondata
                                                                  ?.jsondata
                                                                  ?.rateA ??
                                                              ''),
                                                      textColor: Colors.white,
                                                      size: 10,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 23,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: CustomText(
                                                      text: matchOddTwo(
                                                          liveDetailController
                                                                  .liveLineList[
                                                                      0]
                                                                  .jsondata
                                                                  ?.jsondata
                                                                  ?.rateA ??
                                                              ''),
                                                      textColor: Colors.white,
                                                      size: 10,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            CustomText(
                                              text: "Session",
                                              textColor: Colors.white,
                                              size: 13,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 23,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: CustomText(
                                                      text: liveDetailController
                                                              .liveLineList[0]
                                                              .jsonruns
                                                              ?.jsonruns
                                                              ?.sessionA ??
                                                          '',
                                                      textColor: Colors.white,
                                                      size: 10,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 23,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: CustomText(
                                                      text: liveDetailController
                                                              .liveLineList[0]
                                                              .jsonruns
                                                              ?.jsonruns
                                                              ?.sessionB ??
                                                          '',
                                                      textColor: Colors.white,
                                                      size: 10,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            CustomText(
                                              text: "Over",
                                              textColor: Colors.white,
                                              size: 13,
                                            ),
                                            CustomText(
                                              text: liveDetailController
                                                      .liveLineList[0]
                                                      .jsonruns
                                                      ?.jsonruns
                                                      ?.sessionOver ??
                                                  '',
                                              textColor: Colors.white,
                                              size: 13,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            CustomText(
                                              text: "Run x Ball",
                                              textColor: Colors.white,
                                              size: 13,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 23,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: CustomText(
                                                      text: liveDetailController
                                                              .liveLineList[0]
                                                              .jsonruns
                                                              ?.jsonruns
                                                              ?.runxa ??
                                                          '',
                                                      textColor: Colors.white,
                                                      size: 10,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 23,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: CustomText(
                                                      text: liveDetailController
                                                              .liveLineList[0]
                                                              .jsonruns
                                                              ?.jsonruns
                                                              ?.runxb ??
                                                          '',
                                                      textColor: Colors.white,
                                                      size: 10,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.yellow),
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                                child: CustomText(
                                  text: "Batsman",
                                  textColor: Colors.black,
                                  size: 12,
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .15,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          AppTheme.mainColor.withOpacity(0.7)),
                                  color: AppTheme.mainColor.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2),
                                      bottomRight: Radius.circular(2)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppTheme.mainColor),
                                        color: AppTheme.mainColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .35,
                                              child: CustomText(
                                                text: "Player",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: CustomText(
                                                text: "R",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: CustomText(
                                                text: "B",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: CustomText(
                                                text: "4s",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: CustomText(
                                                text: "6s",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .12,
                                              child: CustomText(
                                                text: "SR",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .35,
                                              child: CustomText(
                                                text: "*",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: CustomText(
                                                text: "0",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .10,
                                              child: CustomText(
                                                text: "0",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: CustomText(
                                                text: liveDetailController
                                                        .liveLineList[0]
                                                        .jsondata
                                                        ?.jsondata
                                                        ?.s4 ??
                                                    '',
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: CustomText(
                                                text: liveDetailController
                                                        .liveLineList[0]
                                                        .jsondata
                                                        ?.jsondata
                                                        ?.s6 ??
                                                    '',
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .12,
                                              child: CustomText(
                                                text: "0.0",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .35,
                                              child: CustomText(
                                                text: "",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: CustomText(
                                                text: "0",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .10,
                                              child: CustomText(
                                                text: "0",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: CustomText(
                                                text: liveDetailController
                                                        .liveLineList[0]
                                                        .jsondata
                                                        ?.jsondata
                                                        ?.ns4 ??
                                                    '',
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: CustomText(
                                                text: liveDetailController
                                                        .liveLineList[0]
                                                        .jsondata
                                                        ?.jsondata
                                                        ?.ns6 ??
                                                    '',
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .12,
                                              child: CustomText(
                                                text: "0.0",
                                                textColor: Colors.white,
                                                size: 10,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: CustomText(
                                        text:
                                            "Bowler : ${liveDetailController.liveLineList[0].jsondata?.jsondata?.bowler}",
                                        textColor: Colors.white,
                                        size: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.yellow),
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                                child: CustomText(
                                  text: "Summary",
                                  textColor: Colors.black,
                                  size: 12,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          AppTheme.mainColor.withOpacity(0.7)),
                                  color: AppTheme.mainColor.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2),
                                      bottomRight: Radius.circular(2)),
                                ),
                                child: Text(
                                  liveDetailController.liveLineList[0].jsonruns
                                          ?.jsonruns?.summary ??
                                      '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
            ),
          if (selectedIndex == 1)
            Obx(
              () => liveDetailController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : liveDetailController.scoreList.isEmpty
                      ? Center(
                          child: Text('No Data Found'),
                        )
                      : Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .06,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    itemCount:
                                        liveDetailController.teamList.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex2 = index;
                                          });
                                          liveDetailController.filterScore(
                                              liveDetailController
                                                  .teamList[index]);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0, vertical: 2),
                                          child: Material(
                                            elevation: 5,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              height: 20,
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: selectedIndex2 == index
                                                    ? AppTheme.mainColor
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                    liveDetailController
                                                        .teamList[index],
                                                    style: TextStyle(
                                                        color: selectedIndex2 ==
                                                                index
                                                            ? Colors.white
                                                            : AppTheme
                                                                .mainColor)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              color: AppTheme.mainColor,
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text(
                                          textAlign: TextAlign.center,
                                          "Batsman",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Text(
                                      "R",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Text(
                                      "B",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Text(
                                      "4s",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Text(
                                      "6s",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Text(
                                      "Sr",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    liveDetailController.filterScoreList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: index % 2 == 0
                                        ? Colors.white
                                        : Colors.grey[200],
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor:
                                                      AppTheme.mainColor,
                                                  child: Icon(
                                                    Icons.person,
                                                    color: Colors.white,
                                                    size: 15,
                                                  )),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: 80,
                                                child: Text(
                                                  //textAlign: TextAlign.right,
                                                  liveDetailController
                                                          .filterScoreList[
                                                              index]
                                                          .playerName ??
                                                      '',
                                                  style: TextStyle(
                                                      color: AppTheme.mainColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: Text(
                                            textAlign: TextAlign.right,
                                            liveDetailController
                                                .filterScoreList[index].runs
                                                .toString(),
                                            style: TextStyle(
                                                color: AppTheme.mainColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: Text(
                                            textAlign: TextAlign.right,
                                            liveDetailController
                                                .filterScoreList[index].balls
                                                .toString(),
                                            style: TextStyle(
                                                color: AppTheme.mainColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: Text(
                                            textAlign: TextAlign.right,
                                            liveDetailController
                                                .filterScoreList[index].four
                                                .toString(),
                                            style: TextStyle(
                                                color: AppTheme.mainColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: Text(
                                            textAlign: TextAlign.right,
                                            liveDetailController
                                                .filterScoreList[index].six
                                                .toString(),
                                            style: TextStyle(
                                                color: AppTheme.mainColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: Text(
                                            textAlign: TextAlign.right,
                                            liveDetailController
                                                        .filterScoreList[index]
                                                        .balls !=
                                                    0
                                                ? (num.parse(liveDetailController
                                                            .filterScoreList[
                                                                index]
                                                            .runs
                                                            .toString()) /
                                                        num.parse(
                                                            liveDetailController
                                                                .filterScoreList[
                                                                    index]
                                                                .balls
                                                                .toString()) *
                                                        100)
                                                    .toStringAsFixed(1)
                                                : '0.0',
                                            style: TextStyle(
                                                color: AppTheme.mainColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
            ),
          if (selectedIndex == 2)
            Obx(
              () => liveDetailController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : liveDetailController.oddList.isEmpty
                      ? Center(
                          child: Text('No Data Found'),
                        )
                      : Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .06,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    itemCount: inningList.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedInningIndex = index;
                                          });
                                          if (selectedInningIndex == 0) {
                                            liveDetailController
                                                .filterInning('1');
                                          } else {
                                            liveDetailController
                                                .filterInning('2');
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0, vertical: 2),
                                          child: Material(
                                            elevation: 5,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              height: 20,
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color:
                                                    selectedInningIndex == index
                                                        ? AppTheme.mainColor
                                                        : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(inningList[index],
                                                    style: TextStyle(
                                                        color:
                                                            selectedInningIndex ==
                                                                    index
                                                                ? Colors.white
                                                                : AppTheme
                                                                    .mainColor)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.70,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    liveDetailController.filterOddList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.1,
                                              child: CustomText(
                                                text: liveDetailController
                                                        .filterOddList[index]
                                                        .score ??
                                                    '',
                                                isEllip: true,
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: Column(
                                                children: [
                                                  CustomText(
                                                    text: liveDetailController
                                                            .filterOddList[
                                                                index]
                                                            .overs ??
                                                        '',
                                                  ),
                                                  Divider(
                                                    color: Colors.black,
                                                    thickness: 1,
                                                  ),
                                                  CustomText(
                                                    text: liveDetailController
                                                            .filterOddList[
                                                                index]
                                                            .subdate ??
                                                        '',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: Column(
                                                children: [
                                                  CustomText(
                                                    text: liveDetailController
                                                            .filterOddList[
                                                                index]
                                                            .sessionA ??
                                                        '',
                                                  ),
                                                  Divider(
                                                    color: Colors.black,
                                                    thickness: 1,
                                                  ),
                                                  CustomText(
                                                    text: liveDetailController
                                                            .filterOddList[
                                                                index]
                                                            .sessionB ??
                                                        '',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: CustomText(
                                                text: liveDetailController
                                                        .filterOddList[index]
                                                        .battingteam ??
                                                    '',
                                                maxLines: 2,
                                              ),
                                            ),
                                            CustomText(
                                              text: liveDetailController
                                                      .filterOddList[index]
                                                      .mrateA ??
                                                  '',
                                            ),
                                            CustomText(
                                              text: liveDetailController
                                                      .filterOddList[index]
                                                      .mrateB ??
                                                  '',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
            ),
          if (selectedIndex == 3)
            Obx(
              () => liveDetailController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : liveDetailController.summaryList.isEmpty
                      ? Center(
                          child: Text('No Data Found'),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              CustomText(
                                text: liveDetailController
                                        .summaryList[0].stat1name ??
                                    '',
                                fontWeight: FontWeight.w500,
                              ),
                              Center(
                                child: HtmlWidget(liveDetailController
                                        .summaryList[0].stat1descr ??
                                    ''),
                              ),
                            ],
                          ),
                        ),
            ),
        ],
      ),
    );
  }
}
