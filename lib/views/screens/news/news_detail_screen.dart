import 'package:cached_network_image/cached_network_image.dart';
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
              child: CachedNetworkImage(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.cover,
                imageUrl: newsModel?.urlToImage ??
                    'https://static.toiimg.com/thumb/msid-96657340,width-1070,height-580,imgsize-53200,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg',
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset("assets/cricket.webp"),
              ),
              // Image.network(
              //     newsModel?.urlToImage ??
              //         'https://t4.ftcdn.net/jpg/04/75/01/23/360_F_475012363_aNqXx8CrsoTfJP5KCf1rERd6G50K0hXw.jpg',
              //     fit: BoxFit.fill,
              //     width: double.infinity,
              //     height: MediaQuery.of(context).size.width * 0.6,
              //     errorBuilder: (context, error, stackTrace) {
              //   return Image.network(
              //     "https://t4.ftcdn.net/jpg/04/75/01/23/360_F_475012363_aNqXx8CrsoTfJP5KCf1rERd6G50K0hXw.jpg",
              //     fit: BoxFit.fill,
              //     width: double.infinity,
              //     height: MediaQuery.of(context).size.width * 0.6,
              //   );
              // }),
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
