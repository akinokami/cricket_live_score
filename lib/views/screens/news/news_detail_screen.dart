
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:live_score/models/news_model.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/views/widgets/custom_text.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel? newsModel;
  const NewsDetailScreen({super.key, this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        title: const CustomText(
          text: 'News Detail',
          size: 16,
          fontWeight: FontWeight.w500,
          textColor: Colors.white,
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
              FastCachedImage(
                height: MediaQuery.of(context).size.width * 0.6,
                width: double.infinity,
                url: newsModel?.urlToImage??"https://static.toiimg.com/thumb/msid-96657340,width-1070,height-580,imgsize-53200,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg",
                fit: BoxFit.cover,
                fadeInDuration: const Duration(seconds: 1),
                errorBuilder: (context, exception, stacktrace) {
                  return Image.asset("assets/cricket.webp",fit: BoxFit.cover, height: MediaQuery.of(context).size.height *
                      0.6,);
                },
                loadingBuilder: (context, progress) {
                  debugPrint(
                      'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
                  return Container(
                    height: MediaQuery.of(context).size.width * 0.6,

                    // color: Colors.yellow,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (progress.isDownloading && progress.totalBytes != null)
                          Text(
                              '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                              style: const TextStyle(color: Colors.red)),
                        SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(
                                color: Colors.white,
                                value: progress.progressPercentage.value)),
                      ],
                    ),
                  );

                },
              )

            ),
            const SizedBox(
              height: 20,
            ),
            CustomText(
              text: newsModel?.title ?? '',
              maxLines: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: newsModel?.description ?? '',
              maxLines: 15,
            ),
          ],
        ),
      ),
    );
  }
}
