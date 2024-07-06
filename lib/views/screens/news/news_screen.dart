import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/views/screens/news/news_detail_screen.dart';

import '../../widgets/custom_text.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.mainColor,
          title: const CustomText(
            text: 'News',
            size: 16,
            fontWeight: FontWeight.w500,
            textColor: Colors.white,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Most Recent',
                size: 14,
                textColor: Colors.blueGrey,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              fit: BoxFit.cover,
                              'https://www.si.com/.image/t_share/MTY4MjYxOTEyNDQwMTUzMjUz/maria-sharapova-ap2jpg.jpg',
                              width: MediaQuery.of(context).size.width * 0.32,
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 20,
                        left: 5,
                        right: 10,
                        child: Text(
                            "Providers allow you to not only expose a value, but also create, listen, and dispose of it.",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            )),
                      ),
                      const Positioned(
                        bottom: 10,
                        right: 5,
                        child: Text("Sat Jul 6, 2024, 8:14 AM",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            )),
                      )
                    ]);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'Top Stories',
                size: 14,
                textColor: Colors.blueGrey,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const NewsDetailScreen());
                        },
                        child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://picsum.photos/250?image=9',
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                              textAlign: TextAlign.left,
                                              "Facebook secures exclusive rights to La Liga in India",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blueGrey,
                                              )),
                                          Text(
                                              textAlign: TextAlign.left,
                                              "Facebook secures exclusive rights to La Liga in India",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.blueGrey,
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text("2024 - July - 06",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.blueGrey,
                                                  )),
                                            ],
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
