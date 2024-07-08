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

  @override
  Widget build(BuildContext context) {
    final liveDetailController = Get.put(LiveDetailController());

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
      body: chipList.isNotEmpty
          ? Obx(
              () => liveDetailController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
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
                                  print(selectedIndex);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 2),
                                  child: Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      // height: 30,
                                      // width: 120,
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                                          text: "Team A",
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Image.network(
                                            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Flag_of_the_Philippines.svg/1280px-Flag_of_the_Philippines.svg.png",
                                            width: 50,
                                            height: 50),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.network(
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Flag_of_the_Philippines.svg/1280px-Flag_of_the_Philippines.svg.png",
                                          width: 50,
                                          height: 50,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CustomText(
                                          text: "Team B",
                                          size: 12,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height:
                                      MediaQuery.of(context).size.height * .07,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppTheme.mainColor
                                            .withOpacity(0.7)),
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
                                            text: "0/0",
                                            textColor: Colors.white,
                                            size: 13,
                                          ),
                                          CustomText(
                                            text: "Overs : 0.0",
                                            textColor:
                                                Colors.white.withOpacity(0.5),
                                            size: 13,
                                          ),
                                        ],
                                      ),
                                      CustomText(
                                        text: "0/0",
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
                                        color: AppTheme.mainColor
                                            .withOpacity(0.7)),
                                    color: AppTheme.mainColor.withOpacity(0.7),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(2),
                                        bottomRight: Radius.circular(2)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: ".   .   .   .   .   .   .",
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
                                        color: AppTheme.mainColor
                                            .withOpacity(0.7)),
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
                                            text: "Team A",
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
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                        text: "96",
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
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                        text: "99",
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
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                        text: "0",
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
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                        text: "1",
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
                                                text: "0",
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
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                        text: "0",
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
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                        text: "0",
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
                                        color: AppTheme.mainColor
                                            .withOpacity(0.7)),
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
                                                    .10,
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
                                                  text: "0",
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
                                                  text: "0",
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
                                      SizedBox(height: 20,),
                                      Padding(padding: EdgeInsets.all(10),
                                      child: CustomText(text: "Bowler : 0", textColor: Colors.white, size: 12,),
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
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  height:
                                  MediaQuery.of(context).size.height * .2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppTheme.mainColor
                                            .withOpacity(0.7)),
                                    color: AppTheme.mainColor.withOpacity(0.7),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(2),
                                        bottomRight: Radius.circular(2)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: ".   .   .   .   .   .   .",
                                        textColor: Colors.white,
                                        size: 13,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (selectedIndex == 1)
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
                                            padding: const EdgeInsets.all(5.0),
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
                        if (selectedIndex == 1)
                          Container(
                            color: AppTheme.mainColor,
                            padding: const EdgeInsets.all(10.0),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Batsman",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "R",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "B",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "4s",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "6s",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Sr",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        if (selectedIndex == 1)
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
                                      Row(
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
                                          Text(
                                            liveDetailController
                                                    .filterScoreList[index]
                                                    .playerName ??
                                                '',
                                            style: TextStyle(
                                                color: AppTheme.mainColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        liveDetailController
                                            .filterScoreList[index].runs
                                            .toString(),
                                        style: TextStyle(
                                            color: AppTheme.mainColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        liveDetailController
                                            .filterScoreList[index].balls
                                            .toString(),
                                        style: TextStyle(
                                            color: AppTheme.mainColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        liveDetailController
                                            .filterScoreList[index].four
                                            .toString(),
                                        style: TextStyle(
                                            color: AppTheme.mainColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        liveDetailController
                                            .filterScoreList[index].six
                                            .toString(),
                                        style: TextStyle(
                                            color: AppTheme.mainColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        liveDetailController
                                            .filterScoreList[index].runs
                                            .toString(),
                                        style: TextStyle(
                                            color: AppTheme.mainColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        if (selectedIndex == 2)
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
                                            padding: const EdgeInsets.all(5.0),
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
                        if (selectedIndex == 2)
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
                                          CustomText(
                                            text: liveDetailController
                                                    .filterOddList[index]
                                                    .score ??
                                                '',
                                          ),
                                          IntrinsicWidth(
                                            child: Column(
                                              children: [
                                                CustomText(
                                                  text: liveDetailController
                                                          .filterOddList[index]
                                                          .overs ??
                                                      '',
                                                ),
                                                Divider(
                                                  color: Colors.black,
                                                  thickness: 1,
                                                ),
                                                CustomText(
                                                  text: liveDetailController
                                                          .filterOddList[index]
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
                                                  text: liveDetailController
                                                          .filterOddList[index]
                                                          .sessionA ??
                                                      '',
                                                ),
                                                Divider(
                                                  color: Colors.black,
                                                  thickness: 1,
                                                ),
                                                CustomText(
                                                  text: liveDetailController
                                                          .filterOddList[index]
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
                        if (selectedIndex == 3)
                          liveDetailController.summaryList.isNotEmpty
                              ? Padding(
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
                                )
                              : const Center(
                                  child: Text('No Data Found'),
                                ),
                      ],
                    ),
            )
          : const Center(
              child: Text('No Data Found'),
            ),
    );
  }
}
