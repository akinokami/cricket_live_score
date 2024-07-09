import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/views/screens/news/news_detail_screen.dart';

import '../../../controller/news_controller.dart';
import '../../widgets/custom_text.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController());

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
        body: Obx(
          () => newsController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
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
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () => Get.to(() => NewsDetailScreen(
                                      newsModel: newsController.newsList[
                                          newsController.random + index],
                                    )),
                                child: Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Material(
                                      elevation: 2,
                                      borderRadius: BorderRadius.circular(10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          fit: BoxFit.cover,
                                          newsController
                                                  .newsList[
                                                      newsController.random +
                                                          index]
                                                  .urlToImage ??
                                              'https://t4.ftcdn.net/jpg/04/75/01/23/360_F_475012363_aNqXx8CrsoTfJP5KCf1rERd6G50K0hXw.jpg',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.32,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 5,
                                    right: 10,
                                    child: Text(
                                        newsController
                                                .newsList[
                                                    newsController.random +
                                                        index]
                                                .title ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 5,
                                    child: Text(
                                        newsController
                                                .newsList[index].publishedAt ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        )),
                                  )
                                ]),
                              );
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
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: newsController.newsList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => NewsDetailScreen(
                                        newsModel:
                                            newsController.newsList[index],
                                      ));
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                                newsController.newsList[index]
                                                        .urlToImage ??
                                                    'https://t4.ftcdn.net/jpg/04/75/01/23/360_F_475012363_aNqXx8CrsoTfJP5KCf1rERd6G50K0hXw.jpg',
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                              return Image.network(
                                                "https://t4.ftcdn.net/jpg/04/75/01/23/360_F_475012363_aNqXx8CrsoTfJP5KCf1rERd6G50K0hXw.jpg",
                                                fit: BoxFit.fill,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                              );
                                            }),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                      textAlign: TextAlign.left,
                                                      newsController
                                                              .newsList[index]
                                                              .title ??
                                                          '',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.blueGrey,
                                                      )),
                                                  Text(
                                                      textAlign: TextAlign.left,
                                                      newsController
                                                              .newsList[index]
                                                              .description ??
                                                          '',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.blueGrey,
                                                      )),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                          newsController
                                                                  .newsList[
                                                                      index]
                                                                  .publishedAt ??
                                                              '',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.blueGrey,
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
                      ],
                    ),
                  ),
                ),
        ));
  }
}
