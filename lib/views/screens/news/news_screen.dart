
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/utils/global.dart';
import 'package:live_score/views/screens/news/news_detail_screen.dart';

import '../../../controller/news_controller.dart';
import '../../widgets/custom_text.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool isAccepted = false;
  bool isChecked = false;
  String first = '';

  @override
  void initState() {
    super.initState();
    final box = GetStorage();
    first = box.read('first') ?? '';

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (first == '') {
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => Builder(builder: (context) {
            return StatefulBuilder(
              builder: (context, StateSetter setState) {
                return AlertDialog(
                  title: CustomText(
                    text: 'Privacy Policy',
                    fontWeight: FontWeight.w500,
                  ),
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Text(Global.policy, style: TextStyle(fontSize: 12)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              activeColor: Colors.green,
                              side:  BorderSide(
                                  width: 1.5,
                                  color:
                                      isChecked ? Colors.green : Colors.black,
                                ),

                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                  if (isChecked) {
                                    isAccepted = true;
                                  } else {
                                    isAccepted = false;
                                  }
                                });
                              },
                            ),
                            CustomText(
                              text: 'I agreed to the Privacy Policy.',
                              size: 12,
                            )
                          ],
                        ),
                        ElevatedButton(
                          child: CustomText(
                            text: 'Accept',
                            size: 14,
                            textColor: Colors.white,
                          ),
                          onPressed: isAccepted
                              ? () {
                                  final box = GetStorage();
                                  box.write('first', 'notfirst');
                                  Navigator.pop(context);
                                }
                              : null,
                        ),
                      ],
                    )),
                  ),
                );
              },
            );
          }),
        );
      }
    });
  }

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
                  child: ListView(
                    children: [
                      // const CustomText(
                      //   text: 'Most Recent',
                      //   size: 14,
                      //   textColor: Colors.blueGrey,
                      //   fontWeight: FontWeight.w500,
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.2,
                      //   child: ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: 5,
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return InkWell(
                      //         onTap: () => Get.to(() => NewsDetailScreen(
                      //               newsModel: newsController.newsList[
                      //                   newsController.random + index],
                      //             )),
                      //         child: Stack(children: [
                      //           Padding(
                      //             padding: const EdgeInsets.only(right: 10),
                      //             child: Material(
                      //               elevation: 2,
                      //               borderRadius: BorderRadius.circular(10),
                      //               child: ClipRRect(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 child: Image.network(
                      //                   fit: BoxFit.cover,
                      //                   newsController
                      //                           .newsList[
                      //                               newsController.random +
                      //                                   index]
                      //                           .urlToImage ??
                      //                       'https://t4.ftcdn.net/jpg/04/75/01/23/360_F_475012363_aNqXx8CrsoTfJP5KCf1rERd6G50K0hXw.jpg',
                      //                   width:
                      //                       MediaQuery.of(context).size.width *
                      //                           0.32,
                      //                   height:
                      //                       MediaQuery.of(context).size.height *
                      //                           0.2,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Positioned(
                      //             bottom: 20,
                      //             left: 5,
                      //             right: 10,
                      //             child: Text(
                      //                 newsController
                      //                         .newsList[
                      //                             newsController.random + index]
                      //                         .title ??
                      //                     '',
                      //                 style: TextStyle(
                      //                   fontSize: 10,
                      //                   fontWeight: FontWeight.normal,
                      //                   color: Colors.white,
                      //                 )),
                      //           ),
                      //           Positioned(
                      //             bottom: 10,
                      //             right: 5,
                      //             child: Text(
                      //                 newsController
                      //                         .newsList[index].publishedAt ??
                      //                     '',
                      //                 style: TextStyle(
                      //                   fontSize: 10,
                      //                   fontWeight: FontWeight.normal,
                      //                   color: Colors.white,
                      //                 )),
                      //           )
                      //         ]),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      const CustomText(
                        text: 'Top Stories',
                        size: 14,
                        textColor: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: newsController.newsList.length,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return Padding(
                      //       padding: const EdgeInsets.only(bottom: 10),
                      //       child: InkWell(
                      //         onTap: () {
                      //           Get.to(() => NewsDetailScreen(
                      //                 newsModel: newsController.newsList[index],
                      //               ));
                      //         },
                      //         child: Card(
                      //             elevation: 5,
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   ClipRRect(
                      //                     borderRadius:
                      //                         BorderRadius.circular(10),
                      //                     child: Image.network(
                      //                         newsController.newsList[index]
                      //                                 .urlToImage ??
                      //                             'https://t4.ftcdn.net/jpg/04/75/01/23/360_F_475012363_aNqXx8CrsoTfJP5KCf1rERd6G50K0hXw.jpg',
                      //                         fit: BoxFit.cover,
                      //                         width: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             0.2,
                      //                         height: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             0.2,
                      //                         errorBuilder:
                      //                             (context, error, stackTrace) {
                      //                       return Image.network(
                      //                         "https://t4.ftcdn.net/jpg/04/75/01/23/360_F_475012363_aNqXx8CrsoTfJP5KCf1rERd6G50K0hXw.jpg",
                      //                         fit: BoxFit.fill,
                      //                         width: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             0.2,
                      //                         height: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             0.2,
                      //                       );
                      //                     }),
                      //                   ),
                      //                   const SizedBox(
                      //                     width: 10,
                      //                   ),
                      //                   SizedBox(
                      //                       width: MediaQuery.of(context)
                      //                               .size
                      //                               .width *
                      //                           0.65,
                      //                       child: Column(
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.start,
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.spaceEvenly,
                      //                         children: [
                      //                           Text(
                      //                               textAlign: TextAlign.left,
                      //                               newsController
                      //                                       .newsList[index]
                      //                                       .title ??
                      //                                   '',
                      //                               style: TextStyle(
                      //                                 fontSize: 12,
                      //                                 fontWeight:
                      //                                     FontWeight.w500,
                      //                                 color: Colors.blueGrey,
                      //                               )),
                      //                           Text(
                      //                               textAlign: TextAlign.left,
                      //                               newsController
                      //                                       .newsList[index]
                      //                                       .description ??
                      //                                   '',
                      //                               style: TextStyle(
                      //                                 fontSize: 10,
                      //                                 fontWeight:
                      //                                     FontWeight.normal,
                      //                                 color: Colors.blueGrey,
                      //                               )),
                      //                           SizedBox(
                      //                             height: 5,
                      //                           ),
                      //                           Row(
                      //                             mainAxisAlignment:
                      //                                 MainAxisAlignment.end,
                      //                             children: [
                      //                               Text(
                      //                                   newsController
                      //                                           .newsList[index]
                      //                                           .publishedAt ??
                      //                                       '',
                      //                                   style: TextStyle(
                      //                                     fontSize: 10,
                      //                                     fontWeight:
                      //                                         FontWeight.normal,
                      //                                     color:
                      //                                         Colors.blueGrey,
                      //                                   )),
                      //                             ],
                      //                           )
                      //                         ],
                      //                       )),
                      //                 ],
                      //               ),
                      //             )),
                      //       ),
                      //     );
                      //   },
                      // ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // number of items in each row
                          mainAxisSpacing: 8.0, // spacing between rows
                          crossAxisSpacing: 8.0, // spacing between columns
                        ),
                        padding: EdgeInsets.all(8.0),
                        itemCount: newsController.newsList.length,
                        itemBuilder: (context, index) {

                          return InkWell(
                            onTap: () => Get.to(() => NewsDetailScreen(
                                  newsModel: newsController.newsList[index],
                                )),
                            child:
                            Stack(children: [
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child:
                                  FastCachedImage(
                                    height: MediaQuery.of(context).size.height *
                                        0.45,
                                    url: newsController
                                               .newsList[index].urlToImage??"https://static.toiimg.com/thumb/msid-96657340,width-1070,height-580,imgsize-53200,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg",
                                    fit: BoxFit.cover,
                                    fadeInDuration: const Duration(seconds: 1),
                                    errorBuilder: (context, exception, stacktrace) {
                                      return Image.asset("assets/cricket.webp",fit: BoxFit.cover, height: MediaQuery.of(context).size.height *
                                          0.45,);
                                    },

                                    loadingBuilder: (context, progress) {
                                      debugPrint(
                                          'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                                      return Container(
                                        height: MediaQuery.of(context).size.width * 0.6,

                                         color: AppTheme.mainColor,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            if (progress.isDownloading && progress.totalBytes != null)
                                              Text(
                                                  '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                                  style: const TextStyle(color: Colors.red)),
                                            Center(
                                              child: SizedBox(
                                                  width: 10,
                                                  height: 10,
                                                  child: CircularProgressIndicator(
                                                      color: Colors.white,
                                                      value: progress.progressPercentage.value)),
                                            ),
                                          ],
                                        ),
                                      );
                                      // return Center(
                                      //   child: CircularProgressIndicator(),
                                      // );
                                    },
                                  ),

                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 5,
                                right: 10,
                                child: Text(
                                    newsController.newsList[index].title ?? '',
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
                      )
                    ],
                  ),
                ),
        ));
  }
}
