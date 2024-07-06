import 'package:flutter/material.dart';
import 'package:live_score/models/match_model.dart';

import '../../../utils/app_theme.dart';

class ChipModel {
  final String title;
  final IconData icon;
  ChipModel({required this.title, required this.icon});
}

class ResultDetailsScreen extends StatefulWidget {
  const ResultDetailsScreen({super.key, required this.matchModel});
  final MatchModel matchModel;

  @override
  State<ResultDetailsScreen> createState() => _ResultDetailsScreenState();
}

class _ResultDetailsScreenState extends State<ResultDetailsScreen> {
  List<ChipModel> chipList = [
    ChipModel(title: 'Score Card', icon: Icons.sports_cricket),
    ChipModel(title: 'Match Odds', icon: Icons.confirmation_num_outlined),
    ChipModel(title: 'Stats', icon: Icons.sports_baseball_sharp),
  ];

  int? selectedIndex;
  int selectedIndex2 = 0;

  @override
  Widget build(BuildContext context) {
    List<String> teamPlayerChipList = [
      widget.matchModel.teamA ?? '',
      widget.matchModel.teamB ?? '',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          widget.matchModel.title ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: chipList.isNotEmpty
          ? SingleChildScrollView(
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
                    Container(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListView.builder(
                            itemCount: teamPlayerChipList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex2 = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 2),
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 20,
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        color: selectedIndex2 == index
                                            ? AppTheme.mainColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(teamPlayerChipList[index],
                                            style: TextStyle(
                                                color: selectedIndex2 == index
                                                    ? Colors.white
                                                    : AppTheme.mainColor)),
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
                  if (selectedIndex == 0)
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
                  if (selectedIndex == 0)
                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return Container(
                              color: index % 2 == 0
                                  ? Colors.white
                                  : Colors.grey[200],
                              padding: const EdgeInsets.all(10.0),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                          radius: 10,
                                          backgroundColor: AppTheme.mainColor,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 15,
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                            color: AppTheme.mainColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "8",
                                    style: TextStyle(
                                        color: AppTheme.mainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        color: AppTheme.mainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        color: AppTheme.mainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        color: AppTheme.mainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '133.3',
                                    style: TextStyle(
                                        color: AppTheme.mainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            );
                          },
                        ))
                ],
              ),
            )
          : const Center(
              child: Text('No Data Found'),
            ),
    );
  }
}
