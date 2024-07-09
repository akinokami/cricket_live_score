import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_score/controller/match_detail_controller.dart';
import 'package:live_score/views/widgets/custom_text.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../utils/app_theme.dart';

class ChipModel {
  final String title;
  final IconData icon;
  ChipModel({required this.title, required this.icon});
}

class ResultDetailsScreen extends StatefulWidget {
  const ResultDetailsScreen({super.key});

  @override
  State<ResultDetailsScreen> createState() => _ResultDetailsScreenState();
}

class _ResultDetailsScreenState extends State<ResultDetailsScreen> {
  List<ChipModel> chipList = [
    ChipModel(title: 'Score Card', icon: Icons.sports_cricket),
    ChipModel(title: 'Match Odds', icon: Icons.confirmation_num_outlined),
    ChipModel(title: 'Stats', icon: Icons.sports_baseball_sharp),
  ];

  int? selectedIndex = 0;
  int selectedIndex2 = 0;

  List<String> inningList = ['1st Innings', '2nd Innings'];
  int selectedInningIndex = 0;

  @override
  Widget build(BuildContext context) {
    final matchDetailController = Get.put(MatchDetailController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          matchDetailController.title.value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .06,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          if (selectedIndex == 0) {
                            matchDetailController.getScore();
                          } else if (selectedIndex == 1) {
                            matchDetailController.getOdd();
                          } else if (selectedIndex == 2) {
                            matchDetailController.getSummary();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 2),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 20,
                              width: 120,
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? AppTheme.mainColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(chipList[index].icon,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : AppTheme.mainColor),
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
                    itemCount: chipList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ],
              ),
            ),
            if (selectedIndex == 0)
              Obx(
                () => matchDetailController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : matchDetailController.scoreList.isEmpty
                        ? Center(
                            child: Text('No Data Found'),
                          )
                        : Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .06,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                      itemCount:
                                          matchDetailController.teamList.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedIndex2 = index;
                                            });
                                            matchDetailController.filterScore(
                                                matchDetailController
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
                                                      matchDetailController
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
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
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
                                  itemCount: matchDetailController
                                      .filterScoreList.length,
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
                                                    matchDetailController
                                                            .filterScoreList[
                                                                index]
                                                            .playerName ??
                                                        '',
                                                    style: TextStyle(
                                                        color:
                                                            AppTheme.mainColor,
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
                                              matchDetailController
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
                                              matchDetailController
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
                                              matchDetailController
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
                                              matchDetailController
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
                                              matchDetailController
                                                          .filterScoreList[
                                                              index]
                                                          .balls !=
                                                      0
                                                  ? (num.parse(matchDetailController
                                                              .filterScoreList[
                                                                  index]
                                                              .runs
                                                              .toString()) /
                                                          num.parse(
                                                              matchDetailController
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
            if (selectedIndex == 1)
              Obx(
                () => matchDetailController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : matchDetailController.oddList.isEmpty
                        ? Center(
                            child: Text('No Data Found'),
                          )
                        : Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .06,
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
                                              matchDetailController
                                                  .filterInning('1');
                                            } else {
                                              matchDetailController
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
                                                  color: selectedInningIndex ==
                                                          index
                                                      ? AppTheme.mainColor
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(inningList[index],
                                                      style: TextStyle(
                                                          color: selectedInningIndex ==
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
                                height:
                                    MediaQuery.of(context).size.height * 0.70,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: matchDetailController
                                      .filterOddList.length,
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
                                                  text: matchDetailController
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
                                                      text: matchDetailController
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
                                                      text: matchDetailController
                                                              .filterOddList[
                                                                  index]
                                                              .subdate ??
                                                          '',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // VerticalDivider(
                                              //   color: Colors.black,
                                              //   thickness: 1,
                                              // ),

                                              IntrinsicWidth(
                                                child: Column(
                                                  children: [
                                                    CustomText(
                                                      text: matchDetailController
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
                                                      text: matchDetailController
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
                                                  text: matchDetailController
                                                          .filterOddList[index]
                                                          .battingteam ??
                                                      '',
                                                  maxLines: 2,
                                                ),
                                              ),
                                              CustomText(
                                                text: matchDetailController
                                                        .filterOddList[index]
                                                        .mrateA ??
                                                    '',
                                              ),
                                              CustomText(
                                                text: matchDetailController
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
            if (selectedIndex == 2)
              Obx(
                () => matchDetailController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : matchDetailController.summaryList.isEmpty
                        ? const Center(
                            child: Text('No Data Found'),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                CustomText(
                                  text: matchDetailController
                                          .summaryList[0].stat1name ??
                                      '',
                                  fontWeight: FontWeight.w500,
                                ),
                                Center(
                                  child: HtmlWidget(matchDetailController
                                          .summaryList[0].stat1descr ??
                                      ''),
                                ),
                              ],
                            ),
                          ),
              ),
          ],
        ),
      ),
    );
  }
}
