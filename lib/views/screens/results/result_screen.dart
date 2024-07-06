import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_score/controller/result_controller.dart';
import 'package:live_score/views/widgets/custom_text.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resultController = Get.put(ResultController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => resultController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: resultController.resultList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8,
                              top: 8,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  fontWeight: FontWeight.w500,
                                  text: resultController
                                          .resultList[index].title ??
                                      '',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              "${resultController.resultList[index].imageUrl}${resultController.resultList[index].teamAImage}",
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.5,
                                            child: CustomText(
                                                size: 12,
                                                text: resultController
                                                        .resultList[index]
                                                        .teamA ??
                                                    ''),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                        ),
                                        child: Center(
                                            child: const CustomText(
                                          text: 'vs',
                                          fontWeight: FontWeight.bold,
                                          textColor: Colors.white,
                                        ))),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              "${resultController.resultList[index].imageUrl}${resultController.resultList[index].teamBImage}",
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.5,
                                            child: CustomText(
                                                size: 12,
                                                text: resultController
                                                        .resultList[index]
                                                        .teamB ??
                                                    ''),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                    size: 12,
                                    textColor: Colors.blueGrey,
                                    text: resultController
                                            .resultList[index].matchtime ??
                                        ''),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                    size: 12,
                                    textColor: Colors.green,
                                    text: resultController
                                            .resultList[index].result ??
                                        ''),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(36, 54, 101, 1.0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  height: 30,
                                  child: Center(
                                    child: CustomText(
                                      text: "Finished",
                                      textColor: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      size: 12,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
