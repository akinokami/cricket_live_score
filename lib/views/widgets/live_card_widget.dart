import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_score/models/live_match_model.dart';
import 'package:live_score/views/screens/matches/live_details_screen.dart';
import 'package:live_score/views/widgets/custom_text.dart';

class LiveCardWidget extends StatelessWidget {
  final LiveMatchModel? liveMatchModel;
  final String? status;
  const LiveCardWidget({super.key, this.liveMatchModel, this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (status == 'Live') {
          Get.to(() => LiveDetailsScreen(), arguments: {
            'title': liveMatchModel?.title,
            'teamA': liveMatchModel?.teamA,
            'teamB': liveMatchModel?.teamB,
            'matchId': liveMatchModel?.matchId
          });
        }
      },
      child: Card(
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
                text: liveMatchModel?.title ?? '',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "${liveMatchModel?.imgeURL}${liveMatchModel?.teamAImage}",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: CustomText(
                              size: 12, text: liveMatchModel?.teamA ?? ''),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: const Center(
                          child: CustomText(
                        text: 'vs',
                        fontWeight: FontWeight.bold,
                        textColor: Colors.white,
                      ))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "${liveMatchModel?.imgeURL}${liveMatchModel?.teamBImage}",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: CustomText(
                              size: 12, text: liveMatchModel?.teamB ?? ''),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                  size: 12,
                  textColor: Colors.blueGrey,
                  text: liveMatchModel?.matchtime ?? ''),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                  size: 12,
                  textColor: Colors.blueGrey,
                  text: liveMatchModel?.venue ?? ''),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: status == 'Finished',
                child: CustomText(
                    size: 12,
                    textColor: Colors.green,
                    text: liveMatchModel?.result ?? ''),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .4,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(36, 54, 101, 1.0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                height: 30,
                child: Center(
                  child: CustomText(
                    text: status ?? '',
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    size: 12,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
